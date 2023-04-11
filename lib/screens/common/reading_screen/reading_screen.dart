import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm/screens/common/reading_screen/reading_controller.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:icm/widgets/custom_button.dart';
import 'package:icm/widgets/custom_edittext.dart';
import 'package:icm/widgets/top_bar.dart';

class ReadingScreen extends GetView<ReadingController> {
  final controller = Get.put(ReadingController());
  ReadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
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
                        "Dinesh",
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      height: 175,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                          color: taskColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Meter 1",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: primaryColor),
                          ),
                          Text(
                            "Asset Name • +91 987654321 ",
                            maxLines: 3,
                            style:
                                TextStyle(fontSize: 12, color: lightTextColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Last Reading",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomEditText(
                      hintText: "Enter Reading",
                      controller: controller.lastReadingController,
                      keyboardType: TextInputType.number,
                      borderRadius: 10,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Current Reading",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomEditText(
                      hintText: "Enter Reading",
                      controller: controller.currentReadingController,
                      keyboardType: TextInputType.number,
                      borderRadius: 10,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Unit Type",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomEditText(
                      hintText: "Enter Reading",
                      controller: controller.currentReadingController,
                      keyboardType: TextInputType.number,
                      borderRadius: 10,
                      suffixIcon:
                          Icon(Icons.keyboard_arrow_down, color: primaryColor),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomButton(text: "Update", onTap: () {})
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
