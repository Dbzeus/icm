import 'package:flutter/material.dart';
import 'package:icm/utils/custom_colors.dart';

class CustomButton extends StatelessWidget {
  double? height, width;
  double? borderRadius;
  String text;
  Function() onTap;
  EdgeInsets? margin;

  CustomButton({
    Key? key,
    this.width,
    this.height,
    this.margin,
    this.borderRadius,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        margin: margin,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: bgColor),
        )),
      ),
    );
  }
}
