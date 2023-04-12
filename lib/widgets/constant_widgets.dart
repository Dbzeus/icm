import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:icm/widgets/custom_button.dart';

Future showCustomAlertDialog({
  required String title, //required title
  required String content, //required content

  String? cancel,
  String? confirm,
  Function()? onTabCancel,
  Function()? onTabConfirm,
  bool isDismissable = true,
}) async {
  return await Get.defaultDialog(
    radius: 14,
    barrierDismissible: isDismissable,
    onWillPop: () async => isDismissable,
    contentPadding: const EdgeInsets.all(8),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          cancel == null
              ? SizedBox(
            width: Get.width * 0.3,
          )
               :
              CustomButton(
                  height: 35,
                  width: Get.width * 0.3,
                  borderRadius: 5.0,
                  text: cancel, onTap: (){
                Get.back();
                if (onTabCancel != null) {
                  onTabCancel();
                }
              }),

          confirm == null
              ? SizedBox(
            width: Get.width * 0.3,
          )
              :CustomButton(
              height: 35,
              width: Get.width * 0.3,
              borderRadius: 5.0,
              text: confirm, onTap: (){
            Get.back();
            if (onTabConfirm != null) {
              onTabConfirm();
            }
          })

        ],
      )
    ],
    buttonColor: primaryColor,
    title: title,
    content: Text(
      content,
      style: const TextStyle(
        fontSize: 16,
      ),
      textAlign: TextAlign.center,
    ),
    titleStyle: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  );
}
