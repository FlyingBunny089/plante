// Mocks generated by Mockito 5.0.10 from annotations
// in plante/test/ui/shop/shop_product_range_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:io' as _i25;
import 'dart:math' as _i12;

import 'package:flutter/src/services/message_codec.dart' as _i26;
import 'package:flutter/src/widgets/framework.dart' as _i24;
import 'package:flutter/src/widgets/navigator.dart' as _i27;
import 'package:flutter/src/widgets/routes.dart' as _i28;
import 'package:mockito/mockito.dart' as _i1;
import 'package:plante/base/permissions_manager.dart' as _i21;
import 'package:plante/base/result.dart' as _i2;
import 'package:plante/model/product.dart' as _i17;
import 'package:plante/model/shop.dart' as _i15;
import 'package:plante/model/shop_product_range.dart' as _i16;
import 'package:plante/model/shop_type.dart' as _i18;
import 'package:plante/model/user_params.dart' as _i6;
import 'package:plante/model/veg_status.dart' as _i9;
import 'package:plante/model/viewed_products_storage.dart' as _i22;
import 'package:plante/outside/backend/backend.dart' as _i4;
import 'package:plante/outside/backend/backend_error.dart' as _i7;
import 'package:plante/outside/backend/backend_product.dart' as _i8;
import 'package:plante/outside/backend/backend_products_at_shop.dart' as _i10;
import 'package:plante/outside/backend/backend_response.dart' as _i3;
import 'package:plante/outside/backend/backend_shop.dart' as _i11;
import 'package:plante/outside/map/address_obtainer.dart' as _i29;
import 'package:plante/outside/map/open_street_map.dart' as _i31;
import 'package:plante/outside/map/osm_address.dart' as _i30;
import 'package:plante/outside/map/shops_manager.dart' as _i13;
import 'package:plante/outside/map/shops_manager_types.dart' as _i14;
import 'package:plante/outside/products/products_manager.dart' as _i19;
import 'package:plante/outside/products/products_manager_error.dart' as _i20;
import 'package:plante/ui/photos_taker.dart' as _i23;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeResult<OK, ERR> extends _i1.Fake implements _i2.Result<OK, ERR> {}

class _FakeBackendResponse extends _i1.Fake implements _i3.BackendResponse {}

/// A class which mocks [Backend].
///
/// See the documentation for Mockito's code generation for more information.
class MockBackend extends _i1.Mock implements _i4.Backend {
  MockBackend() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void addObserver(_i4.BackendObserver? observer) =>
      super.noSuchMethod(Invocation.method(#addObserver, [observer]),
          returnValueForMissingStub: null);
  @override
  void removeObserver(_i4.BackendObserver? observer) =>
      super.noSuchMethod(Invocation.method(#removeObserver, [observer]),
          returnValueForMissingStub: null);
  @override
  _i5.Future<bool> isLoggedIn() =>
      (super.noSuchMethod(Invocation.method(#isLoggedIn, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<_i2.Result<_i6.UserParams, _i7.BackendError>> loginOrRegister(
          {String? googleIdToken, String? appleAuthorizationCode}) =>
      (super.noSuchMethod(
              Invocation.method(#loginOrRegister, [], {
                #googleIdToken: googleIdToken,
                #appleAuthorizationCode: appleAuthorizationCode
              }),
              returnValue:
                  Future<_i2.Result<_i6.UserParams, _i7.BackendError>>.value(
                      _FakeResult<_i6.UserParams, _i7.BackendError>()))
          as _i5.Future<_i2.Result<_i6.UserParams, _i7.BackendError>>);
  @override
  _i5.Future<_i2.Result<bool, _i7.BackendError>> updateUserParams(
          _i6.UserParams? userParams,
          {String? backendClientTokenOverride}) =>
      (super.noSuchMethod(
              Invocation.method(#updateUserParams, [userParams],
                  {#backendClientTokenOverride: backendClientTokenOverride}),
              returnValue: Future<_i2.Result<bool, _i7.BackendError>>.value(
                  _FakeResult<bool, _i7.BackendError>()))
          as _i5.Future<_i2.Result<bool, _i7.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i8.BackendProduct?, _i7.BackendError>> requestProduct(
          String? barcode) =>
      (super.noSuchMethod(Invocation.method(#requestProduct, [barcode]),
          returnValue:
              Future<_i2.Result<_i8.BackendProduct?, _i7.BackendError>>.value(
                  _FakeResult<_i8.BackendProduct?, _i7.BackendError>())) as _i5
          .Future<_i2.Result<_i8.BackendProduct?, _i7.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i2.None, _i7.BackendError>> createUpdateProduct(
          String? barcode,
          {_i9.VegStatus? vegetarianStatus,
          _i9.VegStatus? veganStatus}) =>
      (super.noSuchMethod(
              Invocation.method(#createUpdateProduct, [
                barcode
              ], {
                #vegetarianStatus: vegetarianStatus,
                #veganStatus: veganStatus
              }),
              returnValue: Future<_i2.Result<_i2.None, _i7.BackendError>>.value(
                  _FakeResult<_i2.None, _i7.BackendError>()))
          as _i5.Future<_i2.Result<_i2.None, _i7.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i2.None, _i7.BackendError>> sendReport(
          String? barcode, String? reportText) =>
      (super.noSuchMethod(Invocation.method(#sendReport, [barcode, reportText]),
              returnValue: Future<_i2.Result<_i2.None, _i7.BackendError>>.value(
                  _FakeResult<_i2.None, _i7.BackendError>()))
          as _i5.Future<_i2.Result<_i2.None, _i7.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i2.None, _i7.BackendError>> sendProductScan(
          String? barcode) =>
      (super.noSuchMethod(Invocation.method(#sendProductScan, [barcode]),
              returnValue: Future<_i2.Result<_i2.None, _i7.BackendError>>.value(
                  _FakeResult<_i2.None, _i7.BackendError>()))
          as _i5.Future<_i2.Result<_i2.None, _i7.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i6.UserParams, _i7.BackendError>> userData() =>
      (super.noSuchMethod(Invocation.method(#userData, []),
              returnValue:
                  Future<_i2.Result<_i6.UserParams, _i7.BackendError>>.value(
                      _FakeResult<_i6.UserParams, _i7.BackendError>()))
          as _i5.Future<_i2.Result<_i6.UserParams, _i7.BackendError>>);
  @override
  _i5.Future<_i2.Result<List<_i10.BackendProductsAtShop>, _i7.BackendError>>
      requestProductsAtShops(Iterable<String>? osmIds) => (super.noSuchMethod(
          Invocation.method(#requestProductsAtShops, [osmIds]),
          returnValue: Future<_i2.Result<List<_i10.BackendProductsAtShop>, _i7.BackendError>>.value(
              _FakeResult<List<_i10.BackendProductsAtShop>,
                  _i7.BackendError>())) as _i5
          .Future<_i2.Result<List<_i10.BackendProductsAtShop>, _i7.BackendError>>);
  @override
  _i5.Future<_i2.Result<List<_i11.BackendShop>, _i7.BackendError>> requestShops(
          Iterable<String>? osmIds) =>
      (super.noSuchMethod(Invocation.method(#requestShops, [osmIds]),
          returnValue: Future<
                  _i2.Result<List<_i11.BackendShop>, _i7.BackendError>>.value(
              _FakeResult<List<_i11.BackendShop>, _i7.BackendError>())) as _i5
          .Future<_i2.Result<List<_i11.BackendShop>, _i7.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i2.None, _i7.BackendError>> productPresenceVote(
          String? barcode, String? osmId, bool? positive) =>
      (super.noSuchMethod(
          Invocation.method(#productPresenceVote, [barcode, osmId, positive]),
          returnValue: Future<_i2.Result<_i2.None, _i7.BackendError>>.value(
              _FakeResult<_i2.None, _i7.BackendError>())) as _i5
          .Future<_i2.Result<_i2.None, _i7.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i2.None, _i7.BackendError>> putProductToShop(
          String? barcode, String? osmId) =>
      (super.noSuchMethod(
              Invocation.method(#putProductToShop, [barcode, osmId]),
              returnValue: Future<_i2.Result<_i2.None, _i7.BackendError>>.value(
                  _FakeResult<_i2.None, _i7.BackendError>()))
          as _i5.Future<_i2.Result<_i2.None, _i7.BackendError>>);
  @override
  _i5.Future<_i2.Result<_i11.BackendShop, _i7.BackendError>> createShop(
          {String? name, _i12.Point<double>? coords, String? type}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #createShop, [], {#name: name, #coords: coords, #type: type}),
              returnValue:
                  Future<_i2.Result<_i11.BackendShop, _i7.BackendError>>.value(
                      _FakeResult<_i11.BackendShop, _i7.BackendError>()))
          as _i5.Future<_i2.Result<_i11.BackendShop, _i7.BackendError>>);
  @override
  _i5.Future<_i3.BackendResponse> customGet(String? path,
          [Map<String, String>? queryParams, Map<String, String>? headers]) =>
      (super.noSuchMethod(
              Invocation.method(#customGet, [path, queryParams, headers]),
              returnValue:
                  Future<_i3.BackendResponse>.value(_FakeBackendResponse()))
          as _i5.Future<_i3.BackendResponse>);
}

/// A class which mocks [ShopsManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockShopsManager extends _i1.Mock implements _i13.ShopsManager {
  MockShopsManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get loadedAreasCount =>
      (super.noSuchMethod(Invocation.getter(#loadedAreasCount), returnValue: 0)
          as int);
  @override
  void addListener(_i14.ShopsManagerListener? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i14.ShopsManagerListener? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  _i5.Future<_i2.Result<Map<String, _i15.Shop>, _i14.ShopsManagerError>> fetchShops(
          _i12.Point<double>? northeast, _i12.Point<double>? southwest) =>
      (super.noSuchMethod(Invocation.method(#fetchShops, [northeast, southwest]),
          returnValue:
              Future<_i2.Result<Map<String, _i15.Shop>, _i14.ShopsManagerError>>.value(
                  _FakeResult<Map<String, _i15.Shop>,
                      _i14.ShopsManagerError>())) as _i5
          .Future<_i2.Result<Map<String, _i15.Shop>, _i14.ShopsManagerError>>);
  @override
  _i5.Future<_i2.Result<_i16.ShopProductRange, _i14.ShopsManagerError>>
      fetchShopProductRange(_i15.Shop? shop, {bool? noCache = false}) => (super
          .noSuchMethod(
              Invocation.method(
                  #fetchShopProductRange, [shop], {#noCache: noCache}),
              returnValue:
                  Future<_i2.Result<_i16.ShopProductRange, _i14.ShopsManagerError>>.value(
                      _FakeResult<_i16.ShopProductRange, _i14.ShopsManagerError>())) as _i5
          .Future<_i2.Result<_i16.ShopProductRange, _i14.ShopsManagerError>>);
  @override
  _i5.Future<_i2.Result<_i2.None, _i14.ShopsManagerError>> putProductToShops(
          _i17.Product? product, List<_i15.Shop>? shops) =>
      (super.noSuchMethod(
              Invocation.method(#putProductToShops, [product, shops]),
              returnValue:
                  Future<_i2.Result<_i2.None, _i14.ShopsManagerError>>.value(
                      _FakeResult<_i2.None, _i14.ShopsManagerError>()))
          as _i5.Future<_i2.Result<_i2.None, _i14.ShopsManagerError>>);
  @override
  _i5.Future<_i2.Result<_i15.Shop, _i14.ShopsManagerError>> createShop(
          {String? name, _i12.Point<double>? coords, _i18.ShopType? type}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #createShop, [], {#name: name, #coords: coords, #type: type}),
              returnValue:
                  Future<_i2.Result<_i15.Shop, _i14.ShopsManagerError>>.value(
                      _FakeResult<_i15.Shop, _i14.ShopsManagerError>()))
          as _i5.Future<_i2.Result<_i15.Shop, _i14.ShopsManagerError>>);
}

/// A class which mocks [ProductsManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductsManager extends _i1.Mock implements _i19.ProductsManager {
  MockProductsManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Result<_i17.Product?, _i20.ProductsManagerError>> getProduct(
          String? barcodeRaw,
          [String? langCode]) =>
      (super.noSuchMethod(Invocation.method(#getProduct, [barcodeRaw, langCode]),
          returnValue: Future<
                  _i2.Result<_i17.Product?, _i20.ProductsManagerError>>.value(
              _FakeResult<_i17.Product?, _i20.ProductsManagerError>())) as _i5
          .Future<_i2.Result<_i17.Product?, _i20.ProductsManagerError>>);
  @override
  _i5.Future<_i2.Result<_i17.Product?, _i20.ProductsManagerError>> inflate(
          _i8.BackendProduct? backendProduct,
          [String? langCode]) =>
      (super.noSuchMethod(Invocation.method(#inflate, [backendProduct, langCode]),
          returnValue: Future<
                  _i2.Result<_i17.Product?, _i20.ProductsManagerError>>.value(
              _FakeResult<_i17.Product?, _i20.ProductsManagerError>())) as _i5
          .Future<_i2.Result<_i17.Product?, _i20.ProductsManagerError>>);
  @override
  _i5.Future<
      _i2.Result<_i17.Product, _i20.ProductsManagerError>> createUpdateProduct(
          _i17.Product? product,
          [String? langCode]) =>
      (super.noSuchMethod(
          Invocation.method(#createUpdateProduct, [product, langCode]),
          returnValue:
              Future<_i2.Result<_i17.Product, _i20.ProductsManagerError>>.value(
                  _FakeResult<_i17.Product, _i20.ProductsManagerError>())) as _i5
          .Future<_i2.Result<_i17.Product, _i20.ProductsManagerError>>);
  @override
  _i5.Future<_i2.Result<_i19.ProductWithOCRIngredients, _i20.ProductsManagerError>>
      updateProductAndExtractIngredients(_i17.Product? product, [String? langCode]) =>
          (super.noSuchMethod(
              Invocation.method(
                  #updateProductAndExtractIngredients, [product, langCode]),
              returnValue: Future<_i2.Result<_i19.ProductWithOCRIngredients, _i20.ProductsManagerError>>.value(
                  _FakeResult<_i19.ProductWithOCRIngredients, _i20.ProductsManagerError>())) as _i5
              .Future<_i2.Result<_i19.ProductWithOCRIngredients, _i20.ProductsManagerError>>);
}

/// A class which mocks [PermissionsManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockPermissionsManager extends _i1.Mock
    implements _i21.PermissionsManager {
  MockPermissionsManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i21.PermissionState> status(_i21.PermissionKind? permission) =>
      (super.noSuchMethod(Invocation.method(#status, [permission]),
              returnValue: Future<_i21.PermissionState>.value(
                  _i21.PermissionState.granted))
          as _i5.Future<_i21.PermissionState>);
  @override
  _i5.Future<_i21.PermissionState> request(_i21.PermissionKind? permission) =>
      (super.noSuchMethod(Invocation.method(#request, [permission]),
              returnValue: Future<_i21.PermissionState>.value(
                  _i21.PermissionState.granted))
          as _i5.Future<_i21.PermissionState>);
  @override
  _i5.Future<bool> openAppSettings() =>
      (super.noSuchMethod(Invocation.method(#openAppSettings, []),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [ViewedProductsStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockViewedProductsStorage extends _i1.Mock
    implements _i22.ViewedProductsStorage {
  MockViewedProductsStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Stream<void> updates() =>
      (super.noSuchMethod(Invocation.method(#updates, []),
          returnValue: Stream<void>.empty()) as _i5.Stream<void>);
  @override
  _i5.Future<void> loadPersistentProductsForTesting() => (super.noSuchMethod(
      Invocation.method(#loadPersistentProductsForTesting, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  List<_i17.Product> getProducts() =>
      (super.noSuchMethod(Invocation.method(#getProducts, []),
          returnValue: <_i17.Product>[]) as List<_i17.Product>);
  @override
  void addProduct(_i17.Product? product) =>
      super.noSuchMethod(Invocation.method(#addProduct, [product]),
          returnValueForMissingStub: null);
  @override
  _i5.Future<void> purgeForTesting() =>
      (super.noSuchMethod(Invocation.method(#purgeForTesting, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [PhotosTaker].
///
/// See the documentation for Mockito's code generation for more information.
class MockPhotosTaker extends _i1.Mock implements _i23.PhotosTaker {
  MockPhotosTaker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<Uri?> takeAndCropPhoto(
          _i24.BuildContext? context, _i25.Directory? outFolder) =>
      (super.noSuchMethod(
          Invocation.method(#takeAndCropPhoto, [context, outFolder]),
          returnValue: Future<Uri?>.value()) as _i5.Future<Uri?>);
  @override
  _i5.Future<Uri?> cropPhoto(String? photoPath, _i24.BuildContext? context,
          _i25.Directory? outFolder) =>
      (super.noSuchMethod(
          Invocation.method(#cropPhoto, [photoPath, context, outFolder]),
          returnValue: Future<Uri?>.value()) as _i5.Future<Uri?>);
  @override
  _i5.Future<_i2.Result<Uri, _i26.PlatformException>?> retrieveLostPhoto() =>
      (super.noSuchMethod(Invocation.method(#retrieveLostPhoto, []),
              returnValue:
                  Future<_i2.Result<Uri, _i26.PlatformException>?>.value())
          as _i5.Future<_i2.Result<Uri, _i26.PlatformException>?>);
}

/// A class which mocks [RouteObserver].
///
/// See the documentation for Mockito's code generation for more information.
class MockRouteObserver<R extends _i27.Route<dynamic>> extends _i1.Mock
    implements _i28.RouteObserver<R> {
  MockRouteObserver() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void subscribe(_i28.RouteAware? routeAware, R? route) =>
      super.noSuchMethod(Invocation.method(#subscribe, [routeAware, route]),
          returnValueForMissingStub: null);
  @override
  void unsubscribe(_i28.RouteAware? routeAware) =>
      super.noSuchMethod(Invocation.method(#unsubscribe, [routeAware]),
          returnValueForMissingStub: null);
  @override
  void didPop(_i27.Route<dynamic>? route, _i27.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didPop, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didPush(
          _i27.Route<dynamic>? route, _i27.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didPush, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didRemove(
          _i27.Route<dynamic>? route, _i27.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didRemove, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didReplace(
          {_i27.Route<dynamic>? newRoute, _i27.Route<dynamic>? oldRoute}) =>
      super.noSuchMethod(
          Invocation.method(
              #didReplace, [], {#newRoute: newRoute, #oldRoute: oldRoute}),
          returnValueForMissingStub: null);
  @override
  void didStartUserGesture(
          _i27.Route<dynamic>? route, _i27.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(
          Invocation.method(#didStartUserGesture, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didStopUserGesture() =>
      super.noSuchMethod(Invocation.method(#didStopUserGesture, []),
          returnValueForMissingStub: null);
}

/// A class which mocks [AddressObtainer].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddressObtainer extends _i1.Mock implements _i29.AddressObtainer {
  MockAddressObtainer() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Result<_i30.OsmAddress, _i31.OpenStreetMapError>>
      addressOfShop(_i15.Shop? shop) => (super.noSuchMethod(
          Invocation.method(#addressOfShop, [shop]),
          returnValue: Future<
                  _i2.Result<_i30.OsmAddress, _i31.OpenStreetMapError>>.value(
              _FakeResult<_i30.OsmAddress, _i31.OpenStreetMapError>())) as _i5
          .Future<_i2.Result<_i30.OsmAddress, _i31.OpenStreetMapError>>);
  @override
  _i5.Future<_i2.Result<_i30.OsmAddress, _i31.OpenStreetMapError>>
      addressOfCoords(_i12.Point<double>? coords) => (super.noSuchMethod(
          Invocation.method(#addressOfCoords, [coords]),
          returnValue: Future<
                  _i2.Result<_i30.OsmAddress, _i31.OpenStreetMapError>>.value(
              _FakeResult<_i30.OsmAddress, _i31.OpenStreetMapError>())) as _i5
          .Future<_i2.Result<_i30.OsmAddress, _i31.OpenStreetMapError>>);
}
