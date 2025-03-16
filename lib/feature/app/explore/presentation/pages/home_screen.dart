import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/feature/app/explore/presentation/cubit/exam_cubit.dart';
import 'package:online_exam/feature/app/explore/presentation/cubit/exam_cubit.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_button.dart';

import '../../../../../core/utils/theme_manager.dart';
import '../cubit/exam_state.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';

  HomeScreen({super.key});

  ExamCubit viewModel = getIt.get<ExamCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Survey',
          style: TextStyle(color: ThemeManager.buttonColor),
        ),
      ),
      body: BlocBuilder<ExamCubit, ExamState>(
        bloc: viewModel..getAllExam(),
        builder: (context, state) {
          if (state.examState == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.examState == Status.error) {
            CustomButton(onPressed: () {}, text: 'Try Again');
          } else if (state.examState == Status.success) {
            return Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Browse by Subject',
                    style: ThemeManager.appTheme.textTheme.titleMedium
                        ?.copyWith(color: Colors.black),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.examEntity?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8.sp),
                          width: double.infinity,
                          height: 80.h,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                  'assets/images/Language Translator.png'),
                              Text(state.examEntity![index].title ?? '')
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
