import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm/routes/app_routes.dart';
import 'package:icm/screens/common/meter_screen/meter_controller.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:icm/widgets/top_bar.dart';

class MeterScreen extends GetView<MeterController> {
  final controller = Get.put(MeterController());
  MeterScreen({Key? key}) : super(key: key);

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
                    "Select Meter",
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
          CircleAvatar(
            backgroundColor: primaryColor,
            radius: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Dinesh",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14, color: primaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Floor 1 • +91 987654321 ",
            style: TextStyle(fontSize: 14, color: lightTextColor),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: taskLightColor)),
            child: Center(
              child: ListTile(
                onTap: () {
                  Get.toNamed(AppRoutes.readingScreen);
                },
                leading: Container(
                  height: 55,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: lightTextColor),
                ),
                title: const Text(
                  "Meter 1",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: primaryColor),
                ),
                subtitle: const Text(
                  "Asset Name • +91 987654321 ",
                  maxLines: 3,
                  style: TextStyle(fontSize: 12, color: lightTextColor),
                ),
                dense: true,
                trailing: Icon(Icons.arrow_right_sharp, color: primaryColor),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
                color: taskColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: taskLightColor)),
            child: Center(
              child: ListTile(
                onTap: () {},
                leading: Container(
                  height: 55,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: lightTextColor),
                ),
                title: const Text(
                  "Meter 2",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: primaryColor),
                ),
                subtitle: const Text(
                  "Asset Name • +91 987654321 ",
                  maxLines: 3,
                  style: TextStyle(fontSize: 12, color: lightTextColor),
                ),
                dense: true,
                trailing: Icon(Icons.arrow_right_sharp, color: primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
