
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QRScanController extends GetxController {
  QRViewController? qrController;
 /* Barcode? result;

  GetStorage box = GetStorage();
  int appId = -1, userId = -1;
  RxBool isLoading = false.obs;
  Rx<IconData> flash = Rx(Icons.flash_on);

  // String qrcode = Get.arguments?['qrcode'] ?? '';
  bool isBreakdown = Get.arguments?['isBreakdown'] ?? false;
  bool isFromGate = Get.arguments?['isFromGate'] ?? false;
  bool isForDetail = Get.arguments?['isForDetail'] ?? false;
*/
 /* @override
  void onInit() async {
    super.onInit();
    userId = box.read(USER_ID) ?? -1;
    appId = box.read(SELECTED_APP_ID) ?? -1;
  }*/

  void onQRViewCreated(QRViewController qr) {
    /*this.qrController = qr;
    qr.resumeCamera();

    this.qrController?.scannedDataStream.listen((scanData) async {
      result = scanData;
      if (result != null && result?.code != null) {
        print(result?.code);
        if (await isNetConnected()) {
          if(isForDetail){
            onDetailLoaded();
          }
          else if (appId == 5 || appId == 6) {
            onSupportDeskLoad();
          } else if (appId == 2) {
            onPPMLoad();
          } else {
            onLoadData();
          }
        }
      }
    });*/
  }

 /* onDetailLoaded() async {
    qrController?.stopCamera();
    isLoading(true);
    var response = await ApiCall()
        .QRCodeScanForDetail(result!.code!.split('/').last);
    if (response != null) {
      if (response['RtnStatus']) {
        await Get.toNamed(Routes.SCAN_ASSET_DETAIL,arguments: response['RtnData'][0]);
        isLoading(false);
        qrController?.resumeCamera();
      } else {
        isLoading(false);
        //showSnackbar('Not Available', '${response.rtnMessage}');
        qrController?.resumeCamera();
      }
    } else {
      isLoading(false);
      qrController?.resumeCamera();
    }
  }*/

 /* onLoadData() async {
    qrController?.stopCamera();
    isLoading(true);
    QRResponse? response = await ApiCall()
        .QRCodeScan(userId, appId, result!.code!.split('/').last);
    if (response != null) {
      if (response.rtnStatus) {
        var res = false;

        if (response.rtnData.length == 1) {
          //if only one
          ChecklistResponse? cresponse = await ApiCall().getChecklist(
              response.rtnData.first.assetID,
              response.rtnData.first.frequencyID);
          if (cresponse != null) {
            if (cresponse.rtnStatus) {
              var args = {
                'list': cresponse.rtnData,
                'slotId': response.rtnData.first.slotID,
                'slotTime': response.rtnData.first.auditSlot,
              };
              res = await Get.toNamed(Routes.CHECKLIST, arguments: args);
            } else {
              showSnackbar('No Data', '${cresponse.rtnMessage}');
            }
          }
        } else {
          //if more then one or not
          res = await Get.toNamed(Routes.TIMELIST, arguments: response.rtnData);
        }

        // if (res) {
        isLoading(false);
        qrController?.resumeCamera();
        // }
      } else {
        isLoading(false);
        //showSnackbar('Not Available', '${response.rtnMessage}');
        qrController?.resumeCamera();
      }
    } else {
      isLoading(false);
      qrController?.resumeCamera();
    }
  }*/

  /*onSupportDeskLoad() async {
    qrController?.stopCamera();
    isLoading(true);
    SupportDeskDetailResponse? response = await ApiCall().getSupportDeskQRScan(
        userId,
        result!.code!.split('/').last); //FE0336DE-338A-43FC-977C-81DA4D33E818
    if (response != null) {
      if (response.rtnStatus) {
        if (appId == 5) {
          await Get.toNamed(Routes.TICKET_CREATE, arguments: response.rtnData);
        } else {
          var res=await Get.toNamed(Routes.HD_CREATE_TICKET,
              arguments: response.rtnData);
          if(res!=null && res){
            var controller=Get.find<HomeController>();
            controller.getDashboardData();
          }
        }
        // if (res != null && res) {
        isLoading(false);
        qrController?.resumeCamera();
        // }
      } else {
        isLoading(false);
       // showSnackbar('Not Available', '${response.rtnMessage}');
        qrController?.resumeCamera();
      }
    } else {
      isLoading(false);
      qrController?.resumeCamera();
    }
  }*/

  /*onPPMLoad() async {
    qrController?.stopCamera();
    isLoading(true);
    var response = await ApiCall().getPPMQrScan(
        result!.code!.split('/').last); //74E15754-4F49-4EE1-A6CC-2633268DE50C
    // await ApiCall().getPPMQrScan("74E15754-4F49-4EE1-A6CC-2633268DE50C"); //74E15754-4F49-4EE1-A6CC-2633268DE50C
    if (response != null) {
      if (response.rtnStatus && response.rtnData.isNotEmpty) {
        if (response.rtnData.length == 1) {
          if (isFromGate &&
              (response.rtnData.first.pPMStatusID == PPM_ONHOLD_STATUS ||
                  response.rtnData.first.pPMStatusID == PPM_BREAKDOWN_STATUS)) {
            await Get.toNamed(Routes.PPM_IN_OUT_WARD,
                arguments: response.rtnData.first);
          } else if (isBreakdown &&
              response.rtnData.first.pPMStatusID == PPM_PENDING_STATUS) {
            await Get.toNamed(Routes.PPM_BREAKDOWN,
                arguments: response.rtnData.first);
          } else if (response.rtnData.first.pPMStatusID != PPM_CANCEL_STATUS &&
              response.rtnData.first.pPMStatusID != PPM_BREAKDOWN_STATUS) {
            await Get.toNamed(Routes.PPM_CHECKLIST,
                arguments: response.rtnData.first);
          }
        } else {
          var res = await Get.toNamed(Routes.PPM_ASSET_LIST, arguments: {
            'title': "PPM",
            'QRCode': "${result!.code!.split('/').last}",
            'isFromQrCode': true,
            'isBreakdown': isBreakdown,
            'isFromGate': isFromGate,
            'assetList': response.rtnData
          });
          // if (res != null && res) {

          // }
        }
        isLoading(false);
        qrController?.resumeCamera();
      } else {
        isLoading(false);
        //showSnackbar('Not Available', '${response.rtnMessage}');
        qrController?.resumeCamera();
      }
    } else {
      isLoading(false);
      qrController?.resumeCamera();
    }
  }*/

  @override
  void onClose() {
    qrController?.dispose();
    super.onClose();
  }
}
