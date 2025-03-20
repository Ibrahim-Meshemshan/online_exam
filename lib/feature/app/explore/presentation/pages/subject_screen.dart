import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_subject_entity.dart';
import 'package:online_exam/feature/app/explore/presentation/cubit/exam_cubit.dart';
import 'package:online_exam/feature/app/explore/presentation/cubit/exam_state.dart';
import 'package:online_exam/feature/app/explore/presentation/pages/subject_details_screen.dart';

import '../../../../../core/utils/theme_manager.dart';

class SubjectScreen extends StatelessWidget {
  static const String routeName = 'subject_screen';

  final viewModel = getIt.get<ExamCubit>();

  @override
  Widget build(BuildContext context) {
    final subject = ModalRoute.of(context)!.settings.arguments as SubjectEntity;

    return Scaffold(
      appBar: AppBar(title: Text(subject.name ?? '')),
      body: BlocBuilder<ExamCubit, ExamState>(
        bloc: viewModel..getAllExamOnSubject(subject.id ?? ''),
        builder: (context, state) {
          if (state.examOnSubjectState == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.examOnSubjectState == Status.error) {
            return Center(child: Text("Error: ${state.examOnSubjectEntity}"));
          } else if (state.examOnSubjectState == Status.success) {
            return ListView.builder(
              itemCount: state.examOnSubjectEntity?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Card(
                    margin: EdgeInsets.all(8.sp),
                    color: ThemeManager.containerColor,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, SubjectDetailsScreen.routeName,
                            arguments: state.examOnSubjectEntity?[index]);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                    'assets/images/Profit.png',
                                    width: 60.w,
                                    height: 70.h,
                                    fit: BoxFit.fill,
                                  ),
                                  title: Text(
                                    state.examOnSubjectEntity![index].title ??
                                        '',
                                    style: ThemeManager
                                        .appTheme.textTheme.titleMedium
                                        ?.copyWith(color: Colors.black),
                                  ),
                                  subtitle: Text(
                                      '${state.examOnSubjectEntity?[index].numberOfQuestions} Question'),
                                  trailing: Text(
                                    '${state.examOnSubjectEntity?[index].numberOfQuestions} Minutes',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: ThemeManager.buttonColor),
                                  ),
                                ),
                                10.verticalSpace
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
