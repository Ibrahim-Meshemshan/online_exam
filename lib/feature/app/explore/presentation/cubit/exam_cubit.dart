import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/app/explore/domain/use_cases/get_all_exam_on_subject_use_case.dart';
import 'package:online_exam/feature/app/explore/domain/use_cases/get_all_subject_use_case.dart';
import 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  ExamCubit(
      {required this.getAllExamOnSubjectUseCase, required this.getAllSubjectEntity})
      : super(const ExamState());
  GetAllExamOnSubjectUseCase getAllExamOnSubjectUseCase;
  GetAllSubjectEntity getAllSubjectEntity;

  void getAllExamOnSubject(String subject) async {
    emit(state.copyWith(examOnSubjectState: Status.loading));
    var either = await getAllExamOnSubjectUseCase.call(subject);
    return either.fold(
          (l) =>
          emit(state.copyWith(
              examOnSubjectState: Status.error, errorExamOnSubject: l.errorMessage)),
          (r) =>
          emit(
            state.copyWith(examOnSubjectState: Status.success, examOnSubjectEntity: r.exams),
          ),
    );
  }


  void getAllSubject() async {
    emit(state.copyWith(subjectState: Status.loading));
    var either = await getAllSubjectEntity.call();
    return either.fold(
          (l) =>
          emit(state.copyWith(
              subjectState: Status.error, subjectError: l.errorMessage)),
          (r) =>
          emit(
            state.copyWith(
                subjectState: Status.success, subjectEntity: r.subjects),
          ),
    );
  }
}
