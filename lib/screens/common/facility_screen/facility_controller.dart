import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/facility.dart';

class FacilityController extends GetxController {

  var title=Get.arguments['title'];
  List<FacilityData> data= Get.arguments["data"];

  RxList<FacilityData> pendingList=RxList();
  RxList<FacilityData> completedList=RxList();

  RxBool selectedTag=false.obs;
  RxBool isLoading=false.obs;

  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    separateData();
  }

  separateData(){
    pendingList(data.where((element) => !element.completed).toList());
    completedList(data.where((element) => element.completed).toList());
    isLoading(false);
  }

  updateCompletedData(FacilityData item) {
    isLoading(true);
    var d=data.firstWhere((element) => element.meterID==item.meterID);
    d.completed=true;
    d.lastReadingDate= DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now());
    separateData();
  }

}
