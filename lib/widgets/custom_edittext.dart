import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icm/utils/custom_colors.dart';

class CustomEditText extends StatelessWidget {
  String? hintText;
  Widget? suffixIcon, prefixIcon;
  bool isDense, obscureText,readOnly;
  double? borderRadius;
  TextInputType? keyboardType;
  int? maxLength;
  Function(String)? onChanged;
  Function()? onTab;
  TextEditingController? controller;
  List<TextInputFormatter>? inputFormatters;
  CustomEditText(
      {required this.hintText,
      this.maxLength,
      required this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.isDense = true,
      this.obscureText = false,
      this.readOnly = false,
      this.borderRadius,
      this.keyboardType,
      this.onTab,
        this.inputFormatters,
      Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLength: maxLength,
      obscureText: obscureText,
      controller: controller,
      readOnly: readOnly,
      onTap: onTab,
      style: const TextStyle(fontSize: 14),
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
          fillColor: taskColor,
          isDense: isDense,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          counter: null,
          counterText: '',
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16))),
    );
  }
}
