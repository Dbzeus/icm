import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:icm/api/api_call.dart';
import 'package:icm/utils/constant_function.dart';
import 'package:icm/utils/location_helper.dart';

import '../../routes/app_routes.dart';

class LogInController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool rememberMe = false.obs;
  RxBool isVisible = false.obs;

  RxBool isLoading = false.obs;
  List data= [];

  logIn() async {
    Get.focusScope!.unfocus();
    if (userNameController.text.isEmpty) {
      toast("Enter user Name");
    } else if (passwordController.text.isEmpty) {
      toast("Enter password");
    } else {
      if (await isNetConnected()) {
        isLoading(true);
        //String token = (await FirebaseMessaging.instance.getToken()) ?? '';
        Position? location = await getCurrentLocation();
        if (location != null) {
          var loginResponse = await ApiCall().checkLogin(
              userNameController.text, passwordController.text, "",
              location.latitude.toString(),
              location.longitude.toString());
          isLoading(false);
          if (loginResponse != null && loginResponse['RtnStatus']) {
            data = loginResponse["RtnData"];
            toast(loginResponse?["RtnMessage"]);
            Get.toNamed(AppRoutes.homeScreen);
          }
          else{
          toast(loginResponse?["RtnMessage"]);
          }
        }
        else{
          toast("location is null");
        }
      }
    }

  }
}
