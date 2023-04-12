import 'package:flutter/material.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              "Overview",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: primaryColor),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            //alignment: Alignment.center,
            height: 150,
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
                color: bgColor,
                border: Border.all(color: taskLightColor),
                borderRadius: BorderRadius.circular(16)),
            child: SfRadialGauge(axes: <RadialAxis>[
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
              /*RadialAxis(
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
              ),*/
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

            ]),

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
        ],
      ),
      bottomNavigationBar: /*BottomAppBar(

          shape: CircularNotchedRectangle(), //shape of notch
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.home_filled,
                    ),
                  ),
                  const Text("Home")
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.home_filled,
                    ),
                  ),
                  const Text("Home")
                ],
              )
            ],
          ),
        ),*/
          BottomNavigationBar(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.qrScanScreen);
        },
        backgroundColor: bgColor,
        child: Image.asset(
          "assets/icon/Qr.jpg",
          width: 30,
          height: 30,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
