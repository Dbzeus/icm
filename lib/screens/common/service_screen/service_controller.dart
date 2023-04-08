import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  TextEditingController searchController = TextEditingController();

  RxInt isIndex = 0.obs;
  RxBool isTask = false.obs;
}
