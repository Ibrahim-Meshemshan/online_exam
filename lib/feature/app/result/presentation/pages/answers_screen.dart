import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/theme_manager.dart';

class AnswersScreen extends StatelessWidget {
  static const String routeName = 'answers_screen';

  const AnswersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Answers"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20.sp),
                    width: double.infinity,
                    height: 348.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.grey),
                    child: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select the correctly punctuated sentence.',
                            style: ThemeManager.appTheme.textTheme.titleMedium
                                ?.copyWith(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
