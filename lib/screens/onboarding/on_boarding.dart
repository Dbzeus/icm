import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm/routes/app_routes.dart';
import 'package:icm/utils/constant_function.dart';

import 'package:icm/widgets/custom_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/background/bg.png",
              fit: BoxFit.cover,
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   height: double.infinity,
          //   color: Colors.white60,
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icon/full_logo.png",
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: "Get Started ->",
                onTap: () {

                 Get.toNamed(AppRoutes.logInScreen);
                },
                margin: const EdgeInsets.symmetric(horizontal: 12),
                borderRadius: 5.0,
                width: double.infinity,
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
