import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


import 'package:icm/utils/custom_colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/constant_widgets.dart';


var connectivity = Connectivity();
isNetConnected() async {
  var result = await connectivity.checkConnectivity();
  bool res = result != ConnectivityResult.none;
  if (!res) {
    toast(
      "Check Your Internet Connection",
    );

   // const SnackBar(content: Text("Check Your Internet Connection",),backgroundColor: primaryColor,);
  }
  return res;
}

notificationPermission()async{
  var status = await Permission.notification.request();
  if (status == PermissionStatus.granted) {
    // Permission granted
  } else if (status == PermissionStatus.denied || status == PermissionStatus.restricted) {
    // Permission denied or restricted, show an explanation
    showCustomAlertDialog(title: 'Notification Permission',
      content: 'Please enable notification access in app settings.',
      confirm: "OK",
      onTabConfirm: ()=> Get.back(),
    );

  } else if (status == PermissionStatus.permanentlyDenied) {
    // Permission permanently denied, open app settings

    showCustomAlertDialog(title: 'Notification Permission',
        content: 'Please enable notification access in app settings.',
        confirm: "Settings",
        onTabConfirm: ()=> openAppSettings(),
        isDismissable: false
    );

  }

}

toast(String? msg) {
  debugPrint(msg ?? "Something went wrong");
  Fluttertoast.showToast(
      msg: msg ?? "Something went wrong",
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: primaryColor,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      fontSize: 15);
}
