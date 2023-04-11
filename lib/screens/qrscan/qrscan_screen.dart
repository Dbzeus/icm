
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm/screens/qrscan/qrscan_controller.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanScreen extends GetView<QRScanController> {
  final controller = Get.put(QRScanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildQrView(),
          //_buildQRView(context),
          //_buildSplitBorder(context),
          Positioned(
            top: 32,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: () {
                      /*controller.qrController?.toggleFlash();
                      controller.flash(
                          (controller.flash.value == Icons.flash_on)
                              ? Icons.flash_off
                              : Icons.flash_on);*/
                    },
                    color: Colors.white,
                    icon: Icon(Icons.flash_on)),
              ],
            ),
          ),
          Positioned(
            top: Get.height * 0.7,
            left: Get.width * 0.28,

            child: const Text(
              "Please place the Qr Code \n      inside of the Square",
              style: TextStyle(

                  fontSize: 14,
                  color: bgColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView() {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (Get.width < 400 || Get.height < 400) ? 250.0 : 400.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Stack(
      children: [
        QRView(
          key: GlobalKey(debugLabel: 'QR'),
          onQRViewCreated: controller.onQRViewCreated,
          overlay: QrScannerOverlayShape(
              borderColor: bgColor,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: scanArea),
          onPermissionSet: (ctrl, p) {
            if (!p) {
              Get.snackbar('Permission Denied', 'Camera Permission Denied');
            }
          },
        ),
        /*Obx(() => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox.shrink()),*/
      ],
    );
  }
 /* Widget _buildQRView(BuildContext context) {
    return QRView(
      key:  GlobalKey(debugLabel: 'QR'),
      onQRViewCreated: controller.onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Theme.of(context).accentColor,
        borderRadius: 16,
        borderLength: 24,
        borderWidth: 8,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }
  Widget _buildSplitBorder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 8,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: MediaQuery.of(context).size.height * 0.2,
      ),
    );
  }*/

}
