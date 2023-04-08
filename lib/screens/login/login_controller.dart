import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  TextEditingController mobNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool rememberMe = false.obs;
  RxBool isVisible = false.obs;
}
