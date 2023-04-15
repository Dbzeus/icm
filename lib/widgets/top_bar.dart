import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icm/utils/custom_colors.dart';

class TopBar extends StatelessWidget {
  TopBar({required this.widget, Key? key}) : super(key: key);

  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          )),
      child: Stack(
        children: [
          Image.asset(
            "assets/background/header_circle.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: 20,
              child: widget),
        ],
      ),
    );
  }
}
