import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icm/screens/common/reading_screen/reading_controller.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:icm/widgets/custom_button.dart';
import 'package:icm/widgets/custom_edittext.dart';
import 'package:icm/widgets/top_bar.dart';

import '../../../widgets/custom_loader.dart';

class ReadingScreen extends GetView<ReadingController> {
  @override
  final controller = Get.put(ReadingController());

  ReadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Stack(
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  TopBar(
                      widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: bgColor),
                            child: const Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Text(
                          controller.item.tenantName,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          decoration: BoxDecoration(
                              color: const Color(0x1a2f2f2f),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
                                  image: CachedNetworkImageProvider(controller.item.faciltyImage)),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.item.meterName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black),
                              ),
                              Text(
                                "${controller.item.locationName} . ${controller.item.buildingName}",
                                maxLines: 1,
                                style: const TextStyle(fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        _buildTitle('Last Reading'),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomEditText(
                          hintText: "${controller.item.openingReading}",
                          controller: null,
                          keyboardType: TextInputType.number,
                          borderRadius: 10,
                          readOnly: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        _buildTitle('Current Reading'),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomEditText(
                          hintText: "Enter Reading",
                          controller: controller.currentReadingController,
                          keyboardType: TextInputType.number,
                          borderRadius: 10,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                            // FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        _buildTitle('Unit Type'),
                        const SizedBox(
                          height: 10,
                        ),
                       Obx(()=>CustomEditText(
                            hintText: "${controller.selectedUnit.value?['UnitName'] ?? "Unit"}",
                            controller: null,
                            keyboardType: TextInputType.number,
                            borderRadius: 10,
                            readOnly: true,
                            onTab: (){
                              controller.showUnitType();
                            },
                            suffixIcon:
                                const Icon(Icons.keyboard_arrow_down, color: primaryColor),
                          ),
                       ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomButton(text: "Update", onTap: ()=> controller.confirmationUpdate())
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(()=>controller.isLoading.value? CustomLoader(
            overlayColor: Colors.transparent,
          ) : const SizedBox.shrink())
        ],
      ),
    );
  }

  _buildTitle(String title){
    return Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
    );
  }

}
