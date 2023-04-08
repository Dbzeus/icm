import 'package:flutter/material.dart';
import 'package:icm/utils/custom_colors.dart';

class TopBar extends StatelessWidget {
  TopBar({required this.widget, Key? key}) : super(key: key);

  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          )),
      child: Stack(
        children: [
          Image.asset(
            "assets/background/headerCircle.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          widget,
        ],
      ),
    );
  }
}
