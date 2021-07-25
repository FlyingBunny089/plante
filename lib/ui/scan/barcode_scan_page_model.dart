import 'package:flutter/cupertino.dart';
import 'package:plante/base/barcode_utils.dart';
import 'package:plante/base/base.dart';
import 'package:plante/base/permissions_manager.dart';
import 'package:plante/base/result.dart';
import 'package:plante/model/product.dart';
import 'package:plante/model/user_params_controller.dart';
import 'package:plante/outside/map/shops_manager.dart';
import 'package:plante/outside/map/shops_manager_types.dart';
import 'package:plante/outside/products/products_manager_error.dart';
import 'package:plante/outside/products/products_obtainer.dart';
import 'package:plante/ui/product/product_page_wrapper.dart';
import 'package:plante/ui/scan/barcode_scan_page.dart';
import 'package:plante/ui/scan/barcode_scan_page_content_state.dart';

enum BarcodeScanPageSearchResult { OK, ERROR_NETWORK, ERROR_OTHER }

class BarcodeScanPageModel with WidgetsBindingObserver {
  final VoidCallback _onStateChangeCallback;
  final ResCallback<BarcodeScanPage> _widgetCallback;
  final ProductsObtainer _productsObtainer;
  final ShopsManager _shopsManager;
  final PermissionsManager _permissionsManager;
  final UserParamsController _userParamsController;

  String? _barcode;
  bool _searching = false;
  Product? _foundProduct;
  PermissionState? _cameraPermission;
  String _manualBarcode = '';
  bool _manualBarcodeInputShown = false;

  BarcodeScanPage get _widget => _widgetCallback.call();

  String? get barcode => _barcode;
  bool get searching => _searching;
  bool get cameraAvailable => _cameraPermission == PermissionState.granted;
  bool get manualBarcodeInputShown => _manualBarcodeInputShown;

  set manualBarcodeInputShown(bool value) {
    _manualBarcodeInputShown = value;
    _widgetCallback.call();
  }

  BarcodeScanPageModel(
      this._onStateChangeCallback,
      this._widgetCallback,
      this._productsObtainer,
      this._shopsManager,
      this._permissionsManager,
      this._userParamsController) {
    _updateCameraPermission();
    WidgetsBinding.instance!.addObserver(this);
  }

  void _updateCameraPermission() async {
    final permission = await _permissionsManager.status(PermissionKind.CAMERA);
    if (permission == PermissionState.denied &&
        _cameraPermission == PermissionState.permanentlyDenied) {
      // That's a trick the OS plays on us!
      // In the reality camera permission is still permanently denied.
      return;
    }
    _cameraPermission = permission;
    _onStateChangeCallback.call();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _updateCameraPermission();
    }
  }

  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
  }

  void onProductExternalUpdate(Product updatedProduct) {
    _foundProduct = updatedProduct;
    _onStateChangeCallback.call();
  }

  void _onFoundProductCanceled() {
    _foundProduct = null;
    _barcode = null;
    _onStateChangeCallback.call();
  }

  BarcodeScanPageContentState get contentState {
    if (_cameraPermission != null &&
        _cameraPermission != PermissionState.granted &&
        !_manualBarcodeInputShown) {
      if (_cameraPermission == PermissionState.denied) {
        final requestPermission = () async {
          _cameraPermission =
              await _permissionsManager.request(PermissionKind.CAMERA);
          _onStateChangeCallback.call();
        };
        return BarcodeScanPageContentState.noPermission(requestPermission);
      } else {
        return BarcodeScanPageContentState.cannotAskPermission(
            _permissionsManager.openAppSettings);
      }
    } else if (_barcode == null) {
      return BarcodeScanPageContentState.nothingScanned();
    } else if (_searching && _barcode != null) {
      return BarcodeScanPageContentState.searchingProduct(_barcode!);
    } else if (_foundProduct != null &&
        ProductPageWrapper.isProductFilledEnoughForDisplay(_foundProduct!)) {
      if (_widget.addProductToShop == null) {
        return BarcodeScanPageContentState.productFound(
            _foundProduct!,
            _userParamsController.cachedUserParams!,
            onProductExternalUpdate,
            _onFoundProductCanceled);
      } else {
        return BarcodeScanPageContentState.addProductToShop(
            _foundProduct!,
            _widget.addProductToShop!,
            _addProductToShop,
            _onFoundProductCanceled);
      }
    } else {
      final Product product;
      if (_foundProduct != null) {
        product = _foundProduct!;
      } else {
        product = Product((v) => v.barcode = _barcode);
      }
      return BarcodeScanPageContentState.productNotFound(
          product,
          _widget.addProductToShop,
          onProductExternalUpdate,
          _onFoundProductCanceled);
    }
  }

  Future<BarcodeScanPageSearchResult> searchProduct(String barcode) async {
    _barcode = barcode;
    _searching = true;
    _onStateChangeCallback.call();

    final foundProductResult = await _productsObtainer.getProduct(barcode);

    final foundProduct = foundProductResult.maybeOk();
    _foundProduct = foundProduct;
    _searching = false;
    _barcode = foundProductResult.isOk ? barcode : null;
    _onStateChangeCallback.call();

    if (foundProductResult.isErr) {
      if (foundProductResult.unwrapErr() ==
          ProductsManagerError.NETWORK_ERROR) {
        return BarcodeScanPageSearchResult.ERROR_NETWORK;
      } else {
        return BarcodeScanPageSearchResult.ERROR_OTHER;
      }
    } else {
      return BarcodeScanPageSearchResult.OK;
    }
  }

  void manualBarcodeChanged(String value) {
    _manualBarcode = value;
    _onStateChangeCallback.call();
  }

  bool isManualBarcodeValid() {
    return isBarcodeValid(_manualBarcode);
  }

  Future<Result<None, ShopsManagerError>> _addProductToShop() async {
    final product = _foundProduct!;
    final shop = _widget.addProductToShop!;
    return _shopsManager.putProductToShops(product, [shop]);
  }
}
