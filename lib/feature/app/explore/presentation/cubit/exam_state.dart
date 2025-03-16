import 'package:online_exam/feature/app/explore/domain/entities/all_exam_entity.dart';

enum Status { initial, loading, success, error }

class ExamState {
  final Status examState;
  final String? errorExamMessage;
  final List<ExamsEntity>? examEntity;

  const ExamState({
    this.examState = Status.initial,
    this.errorExamMessage,
    this.examEntity,
  });

  ExamState copyWith({
    Status? examState,
    String? errorExamMessage,
    List<ExamsEntity>? examEntity,
  }) {
    return ExamState(
      examState: examState ?? this.examState,
      errorExamMessage: errorExamMessage ?? this.errorExamMessage,
      examEntity: examEntity ?? this.examEntity,
    );
  }
}
