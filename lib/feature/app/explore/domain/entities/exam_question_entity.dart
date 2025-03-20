class ExamQuestion {
  final int id;
  final String question;
  final List<String> options;
  final String correctAnswer;
  final int duration;
  final int questionCount;

  const ExamQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.duration,
    required this.questionCount,
  });

  /// خاصية محسوبة تُرجع فهرس الإجابة الصحيحة ضمن قائمة الخيارات.
  /// إذا لم يتم العثور على الإجابة الصحيحة في الخيارات، تعيد -1.
  int get correctAnswerIndex => options.indexOf(correctAnswer);
}
