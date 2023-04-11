import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm/screens/tenant/tenant_controller.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:icm/widgets/custom_edittext.dart';
import 'package:icm/widgets/top_bar.dart';

import '../../routes/app_routes.dart';

class TenantScreen extends GetView<TenantController> {
  final controller = Get.put(TenantController());
  TenantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Scaffold(
        body: Column(
          children: [
            TopBar(
                widget: Positioned(
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      "Tenants",
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
                hintText: "Search Tenant..",
                controller: controller.searchController,
                prefixIcon: Icon(Icons.search),
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
      ),
    );
  }

  showTenantList() {
    return Column(
      children: [
        ListTile(
          onTap: () {
            _showServiceBottomSheet();
          },
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

  _showServiceBottomSheet() {
    return Get.bottomSheet(
        isScrollControlled: true,
        Container(
          height: Get.height * 0.7,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          margin: EdgeInsets.only(top: Get.statusBarHeight + 30),
          decoration: const BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: taskLightColor, shape: BoxShape.circle),
                      child: const Icon(Icons.clear, color: primaryColor),
                    ),
                  ),
                  const Text(
                    "Select Services",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: primaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.meterScreen);
                    },
                    child: Container(
                        //alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        /*padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 12),*/
                        decoration: BoxDecoration(
                            color: taskColor,
                            border: Border.all(color: taskLightColor),
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: taskLightColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  "assets/icon/ac.png",
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "AC Unit",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: primaryColor),
                              ),
                            ],
                          ),
                        )),
                  ),
                  Container(
                      //alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      /*padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 12),*/
                      decoration: BoxDecoration(
                          color: bgColor,
                          border: Border.all(color: taskLightColor),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: taskLightColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                "assets/icon/ac.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "AC Unit",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: primaryColor),
                            ),
                          ],
                        ),
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
