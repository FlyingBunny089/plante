import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:openfoodfacts/openfoodfacts.dart' as off;

// ignore: import_of_legacy_library_into_null_safe
import 'package:qr_code_scanner/qr_code_scanner.dart' as qr;
import 'package:untitled_vegan_app/l10n/strings.dart';
import 'package:untitled_vegan_app/ui/product/product_page.dart';

class QrScanPage extends StatefulWidget {
  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> with RouteAware {
  String? _barcode;
  off.Product? _foundProduct;

  qr.QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    GetIt.I.get<RouteObserver<ModalRoute>>()
        .subscribe(this, ModalRoute.of(context)!);
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    GetIt.I.get<RouteObserver<ModalRoute>>()
        .unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    if (ModalRoute.of(context)?.isActive == true) {
      this.controller?.resumeCamera();
    }
  }

  @override
  void didPushNext() {
    this.controller?.pauseCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: _toggleFlash,
                child: Text(context.strings.qr_scan_page_btn_flash)),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: InkWell(child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              width: MediaQuery.of(context).size.width,
              height: _barcode != null ? 100 : 0,
              color: Colors.white,
              child: Center(
                child: Text(
                    _productName(_foundProduct),
                    style: TextStyle(fontSize: 20.0)),
                )
              ),
              onTap: _tryOpenProductPage,
            ),
          )
        ],
      ),
    );
  }

  String _productName(off.Product? product) {
    if (product == null) {
      return context.strings.qr_scan_page_product_not_found;
    }
    if (product.productName != null) {
      return product.productName!;
    }
    return context.strings.qr_scan_page_product_without_name;
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return qr.QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: qr.QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(qr.QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      _onNewScanData(scanData);
    });
  }

  void _onNewScanData(qr.Barcode scanData) async {
    // TODO(https://trello.com/c/LYzlAbXj): request only needed fields
    final configuration = off.ProductQueryConfiguration(
      scanData.code,
      lc: Localizations.localeOf(context).languageCode,
      fields: [off.ProductField.ALL]);
    off.ProductResult foundProduct = await off.OpenFoodAPIClient.getProduct(configuration);
    setState(() {
      _barcode = foundProduct.product?.barcode ?? scanData.code;
      _foundProduct = foundProduct.product;
    });
  }

  void _toggleFlash() async {
    try {
      await controller?.toggleFlash();
    } on qr.CameraException {
      // TODO(https://trello.com/c/XWAE5UVB/): log warning
    }
  }

  void _tryOpenProductPage() {
    if (_barcode == null) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductPage(_foundProduct, _barcode!)),
    );
  }
}
