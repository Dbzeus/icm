import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:icm/api/api_call.dart';
import 'package:icm/model/Facility.dart';
import 'package:icm/routes/app_routes.dart';
import 'package:icm/utils/constant_function.dart';
import 'package:icm/utils/session.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxList dashboardList = [].obs;

RxBool isLoading = false.obs;
  //var userData = Get.arguments["userdata"];
  RxString  userName= "".obs;
  int empId = -1;
  final _box = GetStorage();

  @override
  void onInit() {
    userName(_box.read(Session.userName) ?? "");
    empId = _box.read(Session.userId) ?? 0;
    // TODO: implement onInit
    super.onInit();
    getDashboardDetails();
  }

  getDashboardDetails() async {
    if (await isNetConnected()) {
      isLoading(true);
      var dashboardResponse = await ApiCall().getDashboardDetails(empId);
      isLoading(false);
      if (dashboardResponse != null && dashboardResponse["RtnStatus"]) {
        var temp = dashboardResponse["RtnData"];
        var list = [];
        list.addAll(temp);
        list.addAll(temp);
        list.addAll(temp);
        list.addAll(temp);
        list.addAll(temp);
        list.addAll(temp);
        dashboardList(list);
        toast(dashboardResponse["RtnMessage"]);
      } else {
        toast(dashboardResponse["RtnMessage"]);
      }
    } else {
      toast("Something went wrong");
    }
    isLoading(false);

  }

  getDetailsByFacility(int facilityId) async {
    if (await isNetConnected()) {
      isLoading(true);
      Facility? response = await ApiCall().getDetailsByFacility(empId,facilityId);
      isLoading(false);
      if (response != null && response.rtnStatus) {
        Get.toNamed(AppRoutes.meterScreen,
        arguments: {
          "data": response.rtnData
        });
        toast(response.rtnMessage);
      } else {
        toast(response?.rtnMessage);
      }
    } else {
      toast("Something went wrong");
    }
    isLoading(false);

  }
}
