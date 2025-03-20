import 'package:online_exam/feature/app/explore/domain/entities/exam_question_entity.dart';
import 'package:online_exam/feature/app/explore/presentation/cubit/exam_state.dart';

enum Status { loading, success, error, completed }

class QuestionState {
  final Status status;
  final String? loadingMessage;
  final List<ExamQuestion>? examQuestion;
  final Exception? exception;
  final int selectedAnswer;
  final double timeLeft;
  final double finalScore;

  QuestionState({
    required this.status,
    this.loadingMessage,
    this.examQuestion,
    this.exception,
    this.selectedAnswer = -1,
    this.timeLeft = 30,
    this.finalScore = 0,
  });

  QuestionState copyWith({
    Status? status,
    String? loadingMessage,
    List<ExamQuestion>? examQuestion,
    Exception? exception,
    int? selectedAnswer,
    double? timeLeft,
    double? finalScore,
  }) {
    return QuestionState(
      status: status ?? this.status,
      loadingMessage: loadingMessage ?? this.loadingMessage,
      examQuestion: examQuestion ?? this.examQuestion,
      exception: exception ?? this.exception,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      timeLeft: timeLeft ?? this.timeLeft,
      finalScore: finalScore ?? this.finalScore,
    );
  }
}
