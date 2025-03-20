import 'package:online_exam/feature/app/explore/domain/entities/all_subject_entity.dart';

class AllSubjectDto extends AllSubjectEntity {
  AllSubjectDto({
    super.message,
    super.metadata,
    super.subjects,
  });

  AllSubjectDto.fromJson(dynamic json) {
    message = json['message'];
    metadata = json['metadata'] != null
        ? MetadataDto.fromJson(json['metadata'])
        : null;
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(SubjectDto.fromJson(v));
      });
    }
  }
}

class SubjectDto extends SubjectEntity {
  SubjectDto({
    super.id,
    super.name,
    super.icon,
    super.createdAt,
  });

  SubjectDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
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
