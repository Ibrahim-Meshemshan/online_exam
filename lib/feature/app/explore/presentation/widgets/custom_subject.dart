import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/theme_manager.dart';

class CustomSubject extends StatelessWidget {
   CustomSubject({super.key, this.subject,this.image});

  final String? image;
  final String? subject;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ThemeManager.containerColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Container(
        margin: EdgeInsets.all(8.sp),
        width: double.infinity,
        height: 80.h,
        decoration: BoxDecoration(
          color: ThemeManager.containerColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          spacing: 10,
          children: [
            ClipOval(
              child: Image.network(
                image ?? '',
                width: 48.w,
                height: 48.h,
                fit: BoxFit.fill,
              ),
            ),

            Text(
              subject ?? '',
              style: ThemeManager
                  .appTheme.textTheme.titleMedium
                  ?.copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
