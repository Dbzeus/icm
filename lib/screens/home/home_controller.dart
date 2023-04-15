import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:icm/api/api_call.dart';
import 'package:icm/model/facility.dart';
import 'package:icm/routes/app_routes.dart';
import 'package:icm/utils/constant_function.dart';
import 'package:icm/utils/session.dart';

import '../../widgets/constant_widgets.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxList dashboardList = [].obs;

  RxBool isLoading = false.obs;

  //var userData = Get.arguments["userdata"];
  RxString userName = "".obs;
  int empId = -1;
  final _box = GetStorage();

  @override
  void onInit() {
    userName(_box.read(Session.userName) ?? "");
    empId = _box.read(Session.userId) ?? 0;
    super.onInit();
    getDashboardDetails();
  }

  getDashboardDetails() async {
    if (await isNetConnected()) {
      isLoading(true);
      var dashboardResponse = await ApiCall().getDashboardDetails(empId);
      if (dashboardResponse != null && dashboardResponse["RtnStatus"]) {
        dashboardList(dashboardResponse["RtnData"]);
      } else {
        toast(dashboardResponse["RtnMessage"]);
      }
    }
    isLoading(false);
  }

  getDetailsByFacility(facility) async {
    if (await isNetConnected()) {
      isLoading(true);
      Facility? response =
          await ApiCall().getDetailsByFacility(empId, facility["FacilityID"]);
      if (response != null && response.rtnStatus) {
        Get.toNamed(AppRoutes.facilityScreen, arguments: {
          "title": facility['FacilityName'],
          "data": response.rtnData
        });
      } else {
        toast(response?.rtnMessage);
      }
    }
    isLoading(false);
  }

  logout() {
    showCustomAlertDialog(
        title: 'Logout',
        content: 'Are you sure to logout?',
        confirm: 'Logout',
        cancel: 'Cancel',
        onTabConfirm: () {
          _box.erase();
          Get.offAllNamed(AppRoutes.logInScreen);
        });
  }
}
