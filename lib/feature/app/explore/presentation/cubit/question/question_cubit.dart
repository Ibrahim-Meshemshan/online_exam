import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/feature/app/explore/domain/use_cases/get_all_questions_use_case.dart';
import 'package:online_exam/feature/app/explore/presentation/cubit/question/question_state.dart';

@injectable
class QuestionCubit extends Cubit<QuestionState> {
  final GetAllQuestionsUseCase _getAllQuestionsUseCase;
  Timer? _timer;
  int currentIndex = 0;
  int selectedAnswer = -1;
  int score = 0;
  double timeLeft = 30;

  QuestionCubit(this._getAllQuestionsUseCase)
      : super(QuestionState(status: Status.loading));

  /// جلب الأسئلة من الـ API ومعالجة النتيجة
  Future<void> fetchQuestions() async {
    emit(state.copyWith(
        status: Status.loading, loadingMessage: "جاري تحميل الأسئلة..."));

    final result = await _getAllQuestionsUseCase.getAllQuestions();
    print("Fetched Data: $result");

    result.fold(
          (failure) =>
          emit(state.copyWith(status: Status.error, exception: Exception(failure.errorMessage))),
          (questions) {
        if (questions.isEmpty) {
          emit(state.copyWith(status: Status.error, exception: Exception("لا توجد أسئلة متاحة")));
        } else {
          emit(state.copyWith(status: Status.success, examQuestion: questions));
          startTimer();
        }
      },
    );
  }

  void startTimer() {
    _timer?.cancel();
    timeLeft = 30;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        timeLeft--;
        emit(state.copyWith(timeLeft: timeLeft));
      } else {
        timer.cancel();
        if (!isClosed) {
          nextQuestion();
        }
      }
    });
  }


  void selectAnswer(int answerIndex) {
    if (isClosed) return;

    selectedAnswer = answerIndex;
    print("Selected answer: $selectedAnswer");

    emit(state.copyWith(selectedAnswer: answerIndex));
  }


  void nextQuestion() {
    if (state.examQuestion == null || state.examQuestion!.isEmpty) {
      print("لا توجد أسئلة متاحة!");
      return;
    }

    if (selectedAnswer != -1) {
      final correctAnswerIndex = state.examQuestion![currentIndex].correctAnswerIndex;
      if (selectedAnswer == correctAnswerIndex) {
        score++;
      }
    }

    if (currentIndex < state.examQuestion!.length - 1) {
      currentIndex++;
      selectedAnswer = -1;
      timeLeft = 30;

      emit(state.copyWith());
      startTimer();
    } else {
      _timer?.cancel();
      showScoreDialog();
    }
  }



  void previousQuestion() {
    if (state.examQuestion == null || state.examQuestion!.isEmpty) {
      print("لا توجد أسئلة متاحة!");
      return;
    }

    if (currentIndex > 0) {
      currentIndex--;
      selectedAnswer = -1;
      timeLeft = 30;

      if (!isClosed) {
        emit(state.copyWith());
        startTimer();
      }
    }
  }

  void showScoreDialog() {
    if (state.examQuestion == null || state.examQuestion!.isEmpty) {
      print("لا توجد أسئلة لعرض النتيجة!");
      return;
    }

    final percentage = state.examQuestion!.isNotEmpty
        ? (score / state.examQuestion!.length) * 100
        : 0.0;

    print("Your score: ${percentage.toStringAsFixed(2)}%");

    if (!isClosed) {
      emit(state.copyWith(status: Status.completed, finalScore: percentage));
    }
  }


  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
