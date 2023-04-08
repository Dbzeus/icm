import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm/screens/common/service_screen/service_controller.dart';
import 'package:icm/utils/custom_colors.dart';

import '../../../widgets/custom_edittext.dart';
import '../../../widgets/topBar.dart';

class ServiceScreen extends GetView<ServiceController> {
  final controller = Get.put(ServiceController());
  ServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(
              widget: Positioned(
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: bgColor),
                      child: const Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Service",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomEditText(
              hintText: "Search Services..",
              controller: controller.searchController,
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(
            () => Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 18),
              //padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: taskColor, borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: controller.isTask.value ? bgColor : taskColor),
                      height: 40,
                      child: Center(
                        child: Text(
                          "Pending",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: controller.isTask.value
                                  ? primaryColor
                                  : lightTextColor),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color:
                              !controller.isTask.value ? bgColor : taskColor),
                      height: 40,
                      child: Center(
                        child: Text(
                          "Completed",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: !controller.isTask.value
                                  ? primaryColor
                                  : lightTextColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (__, _) => showTenantList(),
            ),
          )
        ],
      ),
    );
  }

  showTenantList() {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          leading: const CircleAvatar(
            backgroundColor: primaryColor,
            radius: 25,
          ),
          title: const Text(
            "Priya",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14, color: primaryColor),
          ),
          subtitle: const Text(
            "Floor 1 • +91 987654321 ",
            style: TextStyle(fontSize: 14, color: lightTextColor),
          ),
          dense: true,
        ),
        const Divider(),
      ],
    );
  }
}
