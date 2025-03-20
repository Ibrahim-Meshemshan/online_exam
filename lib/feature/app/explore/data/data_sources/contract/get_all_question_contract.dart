import 'package:dartz/dartz.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/app/explore/data/models/exam_question_model.dart';

abstract class ExamQuestionsContract {
  Future<Either<Failures, List<ExamQuestionModel>>> getAllQuestions();
}
