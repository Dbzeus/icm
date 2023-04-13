import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:icm/routes/app_routes.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:icm/widgets/top_bar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  double value = 15.0;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const CircleAvatar(
                      backgroundColor: bgColor,
                      radius: 25,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/icon/logo.png"),
                        backgroundColor: primaryColor,
                        radius: 23,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
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
                  onTap: () {},
                  child: Image.asset(
                    "assets/icon/logout.png",
                    width: 35,
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(
            height: 30,
          ),
          /*  GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.qrScanScreen);
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
          ),
          const SizedBox(
            height: 30,
          ),*/
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
            height: 20,
          ),
          Obx(()=>
          controller.isLoading.value ? const Expanded(child:  Center(child:  CircularProgressIndicator())):
             Expanded(
               child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: controller.dashboardList.length,
                shrinkWrap: true,

                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1,
                    mainAxisSpacing: 8),
                itemBuilder: (_, index) {
                  return _buildDashboard(controller.dashboardList[index]);
                },
            ),
             ),
          ),

        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin: 5,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(

                    onPressed: () {
                      Get.toNamed(AppRoutes.homeScreen);
                    },
                    icon: const Icon(
                      Icons.home_filled,
                    ),
                  ),
                  const Text("Home")
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.tenantScreen);
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    "Tenants",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      /*BottomNavigationBar(
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
      ),*/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.qrScanScreen);
        },
        backgroundColor: bgColor,
        child: SvgPicture.asset(
          "assets/icon/qricon.svg",
          width: 25,
          height: 25,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildDashboard(dashboardList) {
    return GestureDetector(
      onTap: (){
        controller.getDetailsByFacility(dashboardList["FacilityID"]);
      },
      child: Container(
        alignment: Alignment.center,

        padding: const EdgeInsets.symmetric( horizontal: 12),
        decoration: BoxDecoration(
            color: white,
            border: Border.all(color: taskLightColor),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: taskLightColor,
                  borderRadius: BorderRadius.circular(10)),
              child: CachedNetworkImage(imageUrl: dashboardList["FaciltyImage"],
              height: 30,
                width: 30,
                fit: BoxFit.cover,
              ),
            ),
            const  SizedBox(
              height: 12,
            ),
            Text(
              dashboardList["FacilityName"].toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.blue),
            ),
            const  SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: LinearProgressIndicator(
                  value: dashboardList["Completed"] /dashboardList["Total"] ,

                ),
            ),

            const  SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                text: dashboardList["Completed"].toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                children:[
                  const TextSpan(
                    text: " / ",
              style:  TextStyle(
                fontSize: 12,
                color: lightTextColor

              ),
                  ),
                  TextSpan(
                    text: dashboardList["Total"].toString(),
                    style: const  TextStyle(
                      fontSize: 12,
                        color: lightTextColor
                    ),
                  )
                ]

              )
            ),
            const  SizedBox(
              height: 6,
            ),
            dashboardList["Completed"] == dashboardList["Total"] ?
            const Text("Completed",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.green),
            ) : const Text("Remaining",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.black54),
            ),


          ],
        ),
        /*child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 100,
            showLabels: false,
            showTicks: false,
            startAngle: 120,
            endAngle: 60,
            radiusFactor: 0.9,
            axisLineStyle: AxisLineStyle(
              thickness: 0.1,
              color: const Color.fromARGB(30, 0, 169, 181),
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: 70,
                width: 0.05,
                pointerOffset: 0.07,
                sizeUnit: GaugeSizeUnit.factor,
              )
            ],
          ),
          // Create secondary radial axis for segmented line
          RadialAxis(
            minimum: 0,
            interval: 1,
            maximum: 40,
            showLabels: false,
            showTicks: true,
            showAxisLine: false,
            tickOffset: -0.05,
            offsetUnit: GaugeSizeUnit.factor,
            minorTicksPerInterval: 0,
            startAngle: 120,
            endAngle: 60,
            radiusFactor: 0.9,
            majorTickStyle: MajorTickStyle(
                length: 0.3,
                thickness: 3,
                lengthUnit: GaugeSizeUnit.factor,
                color: Colors.white),
          )
          // Create primary radial axis
          *//*RadialAxis(
                  minimum: 0,
                  interval: 1,
                  maximum: 100,
                  showLabels: false,
                  showTicks: true,
                  startAngle: 120,
                  endAngle: 60,
                  radiusFactor: 0.9,
                  axisLineStyle: const AxisLineStyle(
                    thickness: 0.2,
                    color: Colors.transparent,
                  ),

                  majorTickStyle: const MajorTickStyle(
                      length: 0.5,
                      thickness: 10,
                      color: Colors.transparent),
                ),*//*
          // secondary primary radial axis
          // RadialAxis(
          //   minimum: 0,
          //   interval: 1,
          //   maximum: 100,
          //   showLabels: false,
          //   showTicks: true,
          //   startAngle: 120,
          //   endAngle: 60,
          //   radiusFactor: 0.9,
          //   axisLineStyle: AxisLineStyle(
          //     thickness: 0.1,
          //     color: Colors.transparent,
          //
          //   ),
          //
          //   majorTickStyle: MajorTickStyle(
          //       length: 0.5,
          //       thickness: 10,
          //       color: Colors.transparent),
          // ),
        ]),*/

        /*child: SfRadialGauge(
                  axes: <RadialAxis>[
                     RadialAxis(
                      minimum: 0,
                      maximum: 20,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 90,
                      endAngle: 45,
                      radiusFactor: 0.7,
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.2,
                        color: const Color.fromARGB(30, 0, 169, 181),
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: 15,
                            width: 0.05,
                            sizeUnit: GaugeSizeUnit.factor,
                            enableAnimation: true,
                            animationDuration: 100,
                            animationType: AnimationType.linear)
                      ],
                    ),
                    RadialAxis(
                      minimum: 0,
                      interval: 1,
                      maximum: 200,
                      showLabels: false,
                      showTicks: true,
                      showAxisLine: false,
                      tickOffset: -0.05,
                      offsetUnit: GaugeSizeUnit.factor,
                      minorTicksPerInterval: 0,
                      startAngle: 140,
                      endAngle: 40,
                      radiusFactor: 0.7,
                      majorTickStyle: MajorTickStyle(
                          length: 0.3,
                          thickness: 3,
                          lengthUnit: GaugeSizeUnit.factor,
                          color: Colors.white),
                    )
                  ],
                   title: GaugeTitle(
                      text: 'title',
                      textStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                           fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto'
                      )),
                )*/
      ),
    );
  }
}
