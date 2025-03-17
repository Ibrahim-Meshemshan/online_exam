class AllExamOnSubjectEntity {
  AllExamOnSubjectEntity({
    this.message,
    this.exams,
  });

  String? message;

  List<ExamEntity>? exams;
}

class ExamEntity {
  ExamEntity({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  String? id;
  String? title;
  num? duration;
  String? subject;
  num? numberOfQuestions;
  bool? active;
  String? createdAt;
}
