import 'package:dartz/dartz.dart';
import 'package:online_exam/core/utils/failures.dart' show Failures;
import 'package:online_exam/feature/app/explore/domain/entities/exam_question_entity.dart';

abstract class ExamQuestionFetcherRepo {
  Future<Either<Failures, List<ExamQuestion>>> getAllQuestions();
}
