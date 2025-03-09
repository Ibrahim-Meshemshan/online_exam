import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/theme_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconButton? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isObscure;
  final TextInputType keyboardType;
  final Widget? suffix;
  final String labelText;

  CustomTextFormField({
    super.key,
    this.suffix,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    this.icon,
    this.isObscure = false,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        10.verticalSpace,
        TextFormField(
          cursorColor: Colors.black,
          keyboardType: keyboardType,
          obscureText: isObscure,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            suffix: suffix,
            labelText: labelText,
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xffa6a6a6),
                fontWeight: FontWeight.w400),
            labelStyle: TextStyle(color: ThemeManager.blackColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: ThemeManager.blackColor),
            ),
            suffixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    );
  }
}
