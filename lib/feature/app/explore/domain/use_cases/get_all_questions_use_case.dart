import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/app/explore/domain/entities/exam_question_entity.dart';
import 'package:online_exam/feature/app/explore/domain/repositories/exam_question_repo.dart';

typedef QuestionsResult = Either<Failures, List<ExamQuestion>>;
@injectable
class GetAllQuestionsUseCase {
  final ExamQuestionFetcherRepo _questionFetcher;

  GetAllQuestionsUseCase(this._questionFetcher);

  Future<QuestionsResult> getAllQuestions() {
    return _questionFetcher.getAllQuestions();
  }
}
