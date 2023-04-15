import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:icm/api/api_call.dart';
import 'package:icm/utils/constant_function.dart';
import 'package:icm/utils/session.dart';

import '../../routes/app_routes.dart';

class LogInController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool rememberMe = false.obs;
  RxBool isVisible = true.obs;

  RxBool isLoading = false.obs;

  final _box = GetStorage();

  logIn() async {
    Get.focusScope!.unfocus();
    if (userNameController.text.isEmpty) {
      toast("Enter user Name");
    } else if (passwordController.text.isEmpty) {
      toast("Enter password");
    } else {
      if (await isNetConnected()) {
        //String token = (await FirebaseMessaging.instance.getToken()) ?? '';
        // Position? location = await getCurrentLocation();
        // debugPrint("latitude: ${location?.latitude.toString()}");
        // debugPrint("longtitude: ${location?.longitude.toString()}");
        // if (location != null) {
          isLoading(true);

          var loginResponse = await ApiCall().checkLogin(
              userNameController.text,
              passwordController.text,
              "",
              "",
              "");
          if (loginResponse != null && loginResponse['RtnStatus']) {
            _box.write(Session.isLogin, true);
            _box.write(Session.userName, loginResponse["RtnData"]["FirstName"]);
            _box.write(Session.userId, loginResponse["RtnData"]["EmployeeID"]);
            // var data = loginResponse["RtnData"];
            // debugPrint(data.toString());
            // toast(loginResponse["RtnMessage"]);
            Get.offAllNamed(
              AppRoutes.homeScreen,
              /*arguments: {
              "userdata" : data
            }*/
            );
          } else {
            toast(loginResponse?["RtnMessage"]);
          }
          isLoading(false);

        // } else {
        //   toast("failed to getting location");
        // }
      }
    }
  }
}
