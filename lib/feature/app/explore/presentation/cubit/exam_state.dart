
import '../../domain/entities/all_exam_on_subject_entity.dart';
import '../../domain/entities/all_subject_entity.dart';

enum Status { initial, loading, success, error }

class ExamState {


  final Status examOnSubjectState;
  final String? errorExamOnSubject;
  final List<ExamEntity>? examOnSubjectEntity;

  final Status subjectState;
  final String? subjectError;
  final List<SubjectEntity>? subjectEntity;

  const ExamState({
     this.examOnSubjectState = Status.initial,
    this.errorExamOnSubject,
    this.examOnSubjectEntity,
     this.subjectState = Status.initial,
    this.subjectError,
    this.subjectEntity,
  });

  ExamState copyWith({
    Status? examOnSubjectState,
    String? errorExamOnSubject,
    List<ExamEntity>? examOnSubjectEntity,
    Status? subjectState,
    String? subjectError,
    List<SubjectEntity>? subjectEntity,
  }) {
    return ExamState(
      examOnSubjectState: examOnSubjectState ?? this.examOnSubjectState,
      errorExamOnSubject: errorExamOnSubject ?? this.errorExamOnSubject,
      examOnSubjectEntity: examOnSubjectEntity ?? this.examOnSubjectEntity,
      subjectState: subjectState ?? this.subjectState,
      subjectError: subjectError ?? this.subjectError,
      subjectEntity: subjectEntity ?? this.subjectEntity,
    );
  }
}

