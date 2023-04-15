import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:icm/api/api_call.dart';
import 'package:icm/routes/app_routes.dart';
import 'package:icm/utils/constant_function.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../utils/session.dart';

class QRScanController extends GetxController {

  // need to work in  flash button
  QRViewController? qrController;
  Barcode? result;

  GetStorage box = GetStorage();
  int appId = -1, userId = -1;
  RxBool isLoading = false.obs;
  Rx<IconData> flash = Rx(Icons.flash_on);

  final _box=GetStorage();

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
        if(result?.code!=null){
          qrController?.pauseCamera();
          getDetailByQrcode(result!.code!);
        }
    });
  }

  getDetailByQrcode(String code) async{
    if(await isNetConnected()){
      isLoading(true);
      var response=await ApiCall().getDetailByQrcode(_box.read(Session.userId), code);
      debugPrint('res $response');
      if(response!=null){
        if(response.rtnStatus){
          if(response.rtnData.length==1){
            await Get.toNamed(AppRoutes.readingScreen,arguments: response.rtnData.first);
          }else{
            await Get.toNamed(AppRoutes.facilityScreen,arguments: {
              "title": response.rtnData.first.facilityName,
              "data": response.rtnData
            });
          }
        }else{
          toast(response.rtnMessage);
        }
      }
    }
    qrController?.resumeCamera();
    isLoading(false);
  }

  @override
  void onClose() {
    qrController?.dispose();
    super.onClose();
  }
}
