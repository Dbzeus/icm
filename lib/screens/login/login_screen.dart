import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm/screens/login/login_controller.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:icm/widgets/custom_edittext.dart';

import '../../routes/app_routes.dart';
import '../../widgets/custom_button.dart';

class LogInScreen extends GetView<LogInController> {
  @override
  final controller = Get.put(LogInController());

  LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            Get.focusScope!.unfocus();
          },
          child: Stack(
            children: [
              Image.asset(
                "assets/background/circle.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),

                        const Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Hi, Welcome! 👋",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      " Fill the Required details to Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: lightTextColor,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Mobile Number",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomEditText(
                      hintText: "Enter Your MobileNumber",
                      controller: controller.mobNoController,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Password",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => CustomEditText(
                        hintText: "Enter your password",
                        controller: controller.passwordController,
                        obscureText: controller.isVisible.value,
                        suffixIcon: IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            controller.isVisible(!controller.isVisible.value);
                          },
                          icon: Icon(
                            controller.isVisible.value
                                ? Icons.remove_red_eye_rounded
                                : Icons.remove_red_eye_outlined,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: false,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: controller.rememberMe.value,
                                  onChanged: (val) {}),
                              const Text(
                                "Remember Me",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      text: "Sign In",
                      onTap: () {
                        Get.toNamed(AppRoutes.homeScreen);
                      },
                      //margin: const EdgeInsets.symmetric(horizontal: 12),
                      borderRadius: 5.0,
                      width: double.infinity,
                      height: 50,
                    ),
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
