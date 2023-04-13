
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm/screens/qrscan/qrscan_controller.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanScreen extends GetView<QRScanController> {
  @override
  final controller = Get.put(QRScanController());

  QRScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildQrView(),
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
                    icon: const Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: () {
                      // need to work in  flash button
                      controller.qrController?.toggleFlash();
                      controller.flash(
                          (controller.flash.value == Icons.flash_on)
                              ? Icons.flash_off
                              : Icons.flash_on);
                    },
                    color: Colors.white,
                    icon: const Icon(Icons.flash_on),),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.75,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "Please place the Qr Code\ninside of the Square",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    color: textColor),
              ),
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
        Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox.shrink()),
      ],
    );
  }


}
