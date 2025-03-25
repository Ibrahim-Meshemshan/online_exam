import 'package:dartz/dartz.dart';

import 'package:online_exam/feature/app/explore/domain/entities/all_subject_entity.dart';

import '../../../../../core/utils/failures.dart';
import '../entities/all_exam_on_subject_entity.dart';

abstract class ExamRepo {
  Future<Either<Failures,AllExamOnSubjectEntity>> getAllExamOnSubject(String subject);
  Future<Either<Failures,AllSubjectEntity>> getAllSubject();

}