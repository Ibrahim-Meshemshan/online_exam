class AllExamEntity {
  AllExamEntity({
    this.message,
    this.metadata,
    this.exams,
  });

  String? message;
  MetadataEntity? metadata;
  List<ExamsEntity>? exams;
}

class ExamsEntity {
  ExamsEntity({
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

class MetadataEntity {
  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  num? currentPage;
  num? numberOfPages;
  num? limit;
}
