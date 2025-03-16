import 'package:dartz/dartz.dart';
import 'package:online_exam/feature/app/explore/domain/entities/all_exam_entity.dart';

import '../../../../../core/utils/failures.dart';

abstract class ExamRepo {
  Future<Either<Failures,AllExamEntity>> getAllExam();
}