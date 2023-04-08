import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm/routes/app_routes.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:icm/widgets/topBar.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(
              widget: Positioned(
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: bgColor,
                        child: const CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 23,
                        ),
                        radius: 25,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome back 👋",
                            style:
                                TextStyle(fontSize: 14, color: lightTextColor),
                          ),
                          Text(
                            "Dinesh",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/icon/logout.png",
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          )),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.serviceScreen);
            },
            child: Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: lightTextColor)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon/Qr.jpg",
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Tap to Scan the QR Code",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (index) {
            controller.selectedIndex(index);
            if (index == 1) {
              Get.toNamed(AppRoutes.tenantScreen);
            }
          },
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: primaryColor,
          unselectedItemColor: lightTextColor,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Tenants")
          ],
        ),
      ),
    );
  }
}
