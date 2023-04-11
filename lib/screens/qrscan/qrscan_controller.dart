import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanController extends GetxController {
  QRViewController? qrController;
  Barcode? result;

  GetStorage box = GetStorage();
  int appId = -1, userId = -1;
  RxBool isLoading = false.obs;
  Rx<IconData> flash = Rx(Icons.flash_on);

  /* @override
  void onInit() async {
    super.onInit();
    userId = box.read(USER_ID) ?? -1;
    appId = box.read(SELECTED_APP_ID) ?? -1;
  }*/

  void onQRViewCreated(QRViewController qr) {
    qrController = qr;
    qr.resumeCamera();

    qrController?.scannedDataStream.listen((scanData) async {
      result=scanData;
    });
  }

  @override
  void onClose() {
    qrController?.dispose();
    super.onClose();
  }
}
