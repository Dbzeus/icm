import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:icm/api/api_call.dart';
import 'package:icm/model/facility.dart';
import 'package:icm/screens/home/home_controller.dart';
import 'package:icm/utils/constant_function.dart';
import 'package:icm/widgets/constant_widgets.dart';

import '../../../utils/custom_colors.dart';
import '../../../utils/session.dart';

class ReadingController extends GetxController {
  FacilityData item = Get.arguments;

  var currentReadingController = TextEditingController();
  var unitType = TextEditingController();

  RxList units = RxList();
  Rx selectedUnit = Rx(null);
  RxBool isLoading=false.obs;

  final _box=GetStorage();

  @override
  void onInit() {
    super.onInit();
    getUnitType();
  }

  getUnitType() async {
    if (await isNetConnected()) {
      isLoading(true);
      var response = await ApiCall().getUnitByFacility(item.facilityID);
      if (response != null) {
        if (response['RtnStatus']) {
          units(response['RtnData']);
          selectedUnit(units.singleWhere((element) =>
            element['UnitName'].toString().trim() == item.unitName.trim(),orElse: () => null));
        } else {
          toast('${response['RtnMessage']}');
        }
      }
      isLoading(false);
    }
  }

  showUnitType() async {
    Get.bottomSheet(
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Select Unit Type',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: units.length,
                    itemBuilder: (_, index) => _buildSpinnerText(units[index])),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8))));
  }

  _buildSpinnerText(unit) {
    return Obx(() => InkWell(
          onTap: () {
            selectedUnit(unit);
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    unit['UnitName'],
                    style: const TextStyle(color: primaryColor,),
                  ),
                ),
                selectedUnit.value == unit
                    ? const Icon(
                        Icons.done_rounded,
                        size: 20,
                        color: primaryColor,
                      )
                    : const SizedBox(
                        height: 20,
                      )
              ],
            ),
          ),
        ));
  }

  confirmationUpdate() {
    if (currentReadingController.text.isEmpty) {
      toast('Enter Current Reading');
    } else if (selectedUnit.value == null) {
      toast('Select Unit');
    } else if (double.parse(currentReadingController.text.trim()) <
        item.openingReading) {
      toast('Enter Correct Reading');
    } else {
      Get.focusScope?.unfocus();
      showCustomAlertDialog(
          title: 'Confirm',
          content:
              'Running reading is ${double.parse(currentReadingController.text.trim()) - item.openingReading}\nPlease confirm this reading',
          confirm: 'Update',
          cancel: 'Cancel',
          onTabConfirm: (){
            updateReading();
          }
      );
    }
  }

  updateReading() async{

    if(await isNetConnected()){
      isLoading(true);
      var params={
        "MeterID": item.meterID,
        "TenantID": item.tenantID,
        "OpeningReading": item.openingReading,
        "ClosingReading": double.parse(currentReadingController.text),
        "RunningReading": double.parse(currentReadingController.text.trim()) - item.openingReading,
        "UMID": selectedUnit.value['UnitID'],
        "CUID": _box.read(Session.userId)
      };
      var response=await ApiCall().insertMeterReading(params);
      if(response!=null){
        toast(response['RtnMessage']);
        if(response['RtnStatus']){
          var controller=Get.find<HomeController>();
          controller.getDashboardDetails();
          Get.back(result: true);
        }
      }
      isLoading(false);
    }

  }

}
