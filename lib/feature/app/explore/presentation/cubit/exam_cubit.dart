import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/app/explore/domain/use_cases/get_all_exam_use_case.dart';
import 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  ExamCubit({required this.getAllExamUseCase}) : super(const ExamState());
  GetAllExamUseCase getAllExamUseCase;

  void getAllExam() async {
    emit(state.copyWith(examState: Status.loading));
    var either = await getAllExamUseCase.call();
    return either.fold(
      (l) => emit(state.copyWith(
          examState: Status.error, errorExamMessage: l.errorMessage)),
      (r) => emit(
        state.copyWith(examState: Status.success, examEntity: r.exams),
      ),
    );
  }
}
