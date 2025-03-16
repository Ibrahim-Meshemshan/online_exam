import 'package:online_exam/feature/app/explore/domain/entities/all_exam_entity.dart';

class AllExamDto extends AllExamEntity {
  AllExamDto({
    super.message,
    super.metadata,
    super.exams,
  });

  AllExamDto.fromJson(dynamic json) {
    message = json['message'] ?? '';

    metadata = json['metadata'] != null
        ? MetadataDto.fromJson(json['metadata'])
        : null;


    if (json['exams'] is List) {
      exams = (json['exams'] as List)
          .map((v) => ExamsDto.fromJson(v))
          .toList();
    } else {
      exams = [];
    }
  }

}

class ExamsDto extends ExamsEntity {
  ExamsDto({
    super.id,
    super.title,
    super.duration,
    super.subject,
    super.numberOfQuestions,
    super.active,
    super.createdAt,
  });

  ExamsDto.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    duration = json['duration'];
    subject = json['subject'];
    numberOfQuestions = json['numberOfQuestions'];
    active = json['active'];
    createdAt = json['createdAt'];
  }
}

class MetadataDto extends MetadataEntity {
  MetadataDto({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  MetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
