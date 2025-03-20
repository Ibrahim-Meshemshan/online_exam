import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/feature/app/explore/presentation/cubit/exam_cubit.dart';
import 'package:online_exam/feature/app/explore/presentation/widgets/custom_search.dart';
import 'package:online_exam/feature/app/explore/presentation/widgets/custom_subject.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_button.dart';

import '../../../../../core/utils/theme_manager.dart';
import '../cubit/exam_state.dart';
import 'subject_screen.dart';

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
        bloc: viewModel..getAllSubject(),
        builder: (context, state) {
          if (state.subjectState == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.subjectState == Status.error) {
            CustomButton(onPressed: () {}, text: 'Try Later');
          } else if (state.subjectState == Status.success) {
            return Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSearch(),
                  30.verticalSpace,
                  Text(
                    'Browse by Subject',
                    style: ThemeManager.appTheme.textTheme.titleMedium
                        ?.copyWith(color: Colors.black),
                  ),
                  20.verticalSpace,
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.subjectEntity?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                SubjectScreen.routeName,
                                arguments: state.subjectEntity?[index],
                              );
                            },
                            child: CustomSubject(
                              image: state.subjectEntity![index].icon,
                              subject: state.subjectEntity![index].name,
                            ));
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
