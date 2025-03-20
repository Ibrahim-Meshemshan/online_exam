import 'package:dartz/dartz.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_exam_on_subject_entity.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_subject_entity.dart';



abstract class RemoteDataSourceExamContract {
  Future<Either<Failures, AllExamOnSubjectEntity>> getAllExamOnSubject(String subject);
  Future<Either<Failures, AllSubjectEntity>> getAllSubject();
}
