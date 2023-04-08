import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm/routes/app_routes.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:icm/widgets/custom_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/background/bgImage.jpg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white60,
          ),
          Center(
            child: CustomButton(
              text: "Get Started ->",
              onTap: () {
                Get.toNamed(AppRoutes.logInScreen);
              },
              margin: const EdgeInsets.symmetric(horizontal: 12),
              borderRadius: 5.0,
              width: double.infinity,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
