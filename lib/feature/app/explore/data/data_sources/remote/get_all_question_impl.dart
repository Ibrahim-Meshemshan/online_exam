import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/api_manager/api_manager.dart';
import 'package:online_exam/core/utils/failures.dart' show Failures, ServerError;
import 'package:online_exam/feature/app/explore/data/data_sources/contract/get_all_question_contract.dart';
import 'package:online_exam/feature/app/explore/data/models/exam_question_model.dart';

@Injectable(as: ExamQuestionsContract)
class ExamQuestionFetcherImpl implements ExamQuestionsContract {
  final ApiManager _apiManager;

  ExamQuestionFetcherImpl(this._apiManager);

  @override
  Future<Either<Failures, List<ExamQuestionModel>>> getAllQuestions() async {
    try {
      return await _apiManager.getAllQuestions();
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
