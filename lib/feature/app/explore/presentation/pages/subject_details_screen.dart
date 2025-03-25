import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_exam_on_subject_entity.dart';
import 'package:online_exam/feature/app/explore/presentation/cubit/exam_cubit.dart';
import 'package:online_exam/feature/app/explore/presentation/cubit/exam_state.dart';
import 'package:online_exam/feature/auth/login/presentation/widgets/custom_button.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/utils/theme_manager.dart';

class SubjectDetailsScreen extends StatelessWidget {
  static const String routeName = 'subject_details_screen';

  SubjectDetailsScreen({super.key});

  final viewModel = getIt.get<ExamCubit>();

  @override
  Widget build(BuildContext context) {
    final subjectDetails =
        ModalRoute.of(context)!.settings.arguments as ExamEntity;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/images/Profit.png',
                  width: 60.w,
                  height: 70.h,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  subjectDetails.title ?? '',
                  style: ThemeManager.appTheme.textTheme.titleMedium
                      ?.copyWith(color: Colors.black),
                ),
                subtitle: Text('${subjectDetails.numberOfQuestions} Question'),
                trailing: Text(
                  '${subjectDetails.numberOfQuestions} Minutes',
                  style:
                      TextStyle(fontSize: 13, color: ThemeManager.buttonColor),
                ),
              ),
              Divider(),
              Text('Instructions',
                  style: ThemeManager.appTheme.textTheme.titleMedium
                      ?.copyWith(color: Colors.black)),
              20.verticalSpace,
              Text(subjectDetails.title ?? ''),
              50.verticalSpace,
              Row(
                children: [
                  CustomButton(
                      backgroundColor: ThemeManager.buttonColor,
                      onPressed: () {
                    //todo: Navigator to Question Screen
                  }, text: 'Start'),
                ],
              )
            ],
          ),
        ));
  }
}
/**/

/* BlocBuilder<ExamCubit, ExamState>(
          bloc: viewModel..getAllExamOnSubject(subjectDetails.id ?? ''),
          builder: (context, state) {
            if (state.examOnSubjectState == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.examOnSubjectState == Status.error) {
              return Center(child: Text("Error: ${state.examOnSubjectEntity}"));
            } else if (state.examOnSubjectState == Status.success) {
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return ;

                },
              );
            }
            return const SizedBox();
          },
        )*/
