import 'package:dartz/dartz.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_exam_entity.dart';

abstract class RemoteDataSourceExamContract {
  Future<Either<Failures, AllExamEntity>> getAllExam();
}
