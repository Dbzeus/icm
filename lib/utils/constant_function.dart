import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:icm/utils/custom_colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


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
