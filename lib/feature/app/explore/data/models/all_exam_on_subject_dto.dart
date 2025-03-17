import 'dart:convert';

import 'package:online_exam/feature/app/explore/domain/entities/all_exam_on_subject_entity.dart';

class AllExamOnSubjectDto extends AllExamOnSubjectEntity {
  AllExamOnSubjectDto({
    super.message,

    super.exams,});

  AllExamOnSubjectDto.fromJson(dynamic json) {
    message = json['message'];

    if (json['exams'] != null) {
      exams = [];
      json['exams'].forEach((v) {
        exams?.add(ExamDto.fromJson(v));
      });
    }
  }



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;

    if (exams != null) {
      map['exams'] = exams?.map((v) => jsonDecode(jsonEncode(v))).toList();
    }
    return map;
  }

}

class ExamDto extends ExamEntity{
  ExamDto({
      super.id,
    super.title,
    super.duration,
    super.subject,
    super.numberOfQuestions,
    super.active,
    super.createdAt,});

  ExamDto.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    duration = json['duration'];
    subject = json['subject'];
    numberOfQuestions = json['numberOfQuestions'];
    active = json['active'];
    createdAt = json['createdAt'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['duration'] = duration;
    map['subject'] = subject;
    map['numberOfQuestions'] = numberOfQuestions;
    map['active'] = active;
    map['createdAt'] = createdAt;
    return map;
  }

}

