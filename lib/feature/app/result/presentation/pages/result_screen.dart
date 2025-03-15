import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/theme_manager.dart';
import 'package:online_exam/feature/app/result/presentation/widgets/custom_result_item.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language',
              style: ThemeManager.appTheme.textTheme.titleMedium
                  ?.copyWith(color: Colors.black),
            ),
            10.verticalSpace,
            CustomResultItem(text: 'High Level'),
            10.verticalSpace,
            Text(
              'Math',
              style: ThemeManager.appTheme.textTheme.titleMedium
                  ?.copyWith(color: Colors.black),
            ),
            10.verticalSpace,
            CustomResultItem(text: 'Algebra'),
          ],
        ),
      ),
    );
  }
}
