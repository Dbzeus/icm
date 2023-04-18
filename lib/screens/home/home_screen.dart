import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:icm/routes/app_routes.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:icm/widgets/custom_loader.dart';
import 'package:icm/widgets/top_bar.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  final controller = Get.put(HomeController());
  double value = 15.0;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                  widget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const  CircleAvatar(
                          backgroundImage: AssetImage("assets/icon/logo.png"),
                          backgroundColor: Colors.white,
                          radius: 23,

                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome back 👋",
                              style: TextStyle(fontSize: 14, color: lightTextColor),
                            ),
                            Obx(
                              () => Text(
                                controller.userName.value,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () => controller.logout(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: taskLightColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: SvgPicture.asset(
                          "assets/icon/logout.svg",
                          width: 15,
                          height: 15,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              const SizedBox(
                height: 28,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Overview",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: primaryColor),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => controller.dashboardList.isEmpty && !controller.isLoading.value
                        ? const Expanded(
                            child: Center(child: Text('No Facility Found')))
                        : Expanded(
                            child: GridView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              itemCount: controller.dashboardList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8,
                                      childAspectRatio: 1,
                                      mainAxisSpacing: 8),
                              itemBuilder: (_, index) {
                                return _buildDashboard(
                                    controller.dashboardList[index]);
                              },
                            ),
                          ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(), //shape of notch
            notchMargin: 8,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.homeScreen),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icon/home.svg',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text("Home")
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {}, //Get.toNamed(AppRoutes.tenantScreen),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icon/tenant.svg',
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "Tenants",
                          style: TextStyle(color: lightTextColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed(AppRoutes.qrScanScreen),
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              "assets/icon/qrscan.svg",
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Obx(()=>controller.isLoading.value? CustomLoader(
          overlayColor: Colors.transparent,
        ) : const SizedBox.shrink())
      ],
    );
  }

  _buildDashboard(dashboardList) {
    return GestureDetector(
      onTap: () {
        controller.getDetailsByFacility(dashboardList);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: white,
            border: Border.all(color: taskLightColor),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: taskLightColor,
                  borderRadius: BorderRadius.circular(8)),
              child: CachedNetworkImage(
                imageUrl: dashboardList["FaciltyImage"],
                height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              dashboardList["FacilityName"].toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.blue),
            ),
            const SizedBox(
              height: 12,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: LinearProgressIndicator(
                value: dashboardList["Completed"] / dashboardList["Total"],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text.rich(TextSpan(
                text: dashboardList["Completed"].toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(
                    text: " / ",
                    style: TextStyle(fontSize: 12, color: lightTextColor),
                  ),
                  TextSpan(
                    text: dashboardList["Total"].toString(),
                    style: const TextStyle(fontSize: 13, color: lightTextColor),
                  )
                ])),
            const SizedBox(
              height: 6,
            ),
            dashboardList["Completed"] == dashboardList["Total"]
                ? const Text(
                    "Completed",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.green),
                  )
                : const Text(
                    "Remaining",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.black54),
                  ),
          ],
        ),
      ),
    );
  }
}
