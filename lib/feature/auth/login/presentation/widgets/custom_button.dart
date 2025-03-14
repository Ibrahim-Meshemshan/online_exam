import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/theme_manager.dart';

class CustomButton extends StatelessWidget {
  void Function() onPressed;
  String text;
  Color? backgroundColor;

  CustomButton(
      {required this.onPressed, required this.text, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
          padding: EdgeInsets.all(14.sp),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: ThemeManager.appTheme.textTheme.titleSmall
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
