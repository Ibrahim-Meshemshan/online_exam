import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/failures.dart';
import 'package:online_exam/feature/app/explore/data/data_sources/contract/get_all_question_contract.dart';
import 'package:online_exam/feature/app/explore/domain/entities/exam_question_entity.dart';
import 'package:online_exam/feature/app/explore/domain/repositories/exam_question_repo.dart';

@Injectable(as: ExamQuestionFetcherRepo)
class ExamQuestionFetcherRepoImpl implements ExamQuestionFetcherRepo {
  final ExamQuestionsContract _examQuestionsContract;

  ExamQuestionFetcherRepoImpl(this._examQuestionsContract);

  @override
  Future<Either<Failures, List<ExamQuestion>>> getAllQuestions() async {
    final result = await _examQuestionsContract.getAllQuestions();

    return result.fold(
            (failure) => Left(failure),
            (questions) => Right(questions.map((q) => q.toEntity()).toList()) // تحويل `ExamQuestionModel` إلى `ExamQuestion`
    );
  }
}
