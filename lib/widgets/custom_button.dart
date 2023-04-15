import 'package:flutter/material.dart';
import 'package:icm/utils/custom_colors.dart';

class CustomButton extends StatelessWidget {
  double? height, width;
  double? borderRadius;
  Color textColor;
  Color btnColor;
  String text;
  Function() onTap;
  EdgeInsets? margin;

  CustomButton({
    Key? key,
    this.width,
    this.height,
    this.margin,
    this.borderRadius,
    this.btnColor = buttonColor,
    this.textColor=white,
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
          color: btnColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: textColor),
        )),
      ),
    );
  }
}
