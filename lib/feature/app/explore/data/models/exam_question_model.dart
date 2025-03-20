import 'package:online_exam/feature/app/explore/domain/entities/exam_question_entity.dart';


class AnswerModel {
  final String answer;
  final String key;

  AnswerModel({
    required this.answer,
    required this.key,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      answer: json['answer'] ?? '',
      key: json['key'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'answer': answer,
      'key': key,
    };
  }
}

class ExamQuestionModel {
  final int id;
  final String question;
  final List<AnswerModel> answers;
  final String correctAnswer;
  final int duration;
  final int questionCount;

  ExamQuestionModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.duration,
    required this.questionCount,
  });


  int get correctAnswerIndex {
    return answers.indexWhere((answerModel) => answerModel.key == correctAnswer);
  }


  ExamQuestion toEntity() {

    final correctAnswerText = answers.firstWhere(
          (a) => a.key == correctAnswer,
      orElse: () => AnswerModel(answer: '', key: ''),
    ).answer;

    return ExamQuestion(
      id: id,
      question: question,
      options: answers.map((e) => e.answer).toList(),
      correctAnswer: correctAnswerText,
      duration: duration,
      questionCount: questionCount,
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answers': answers.map((e) => e.toJson()).toList(),
      'correctAnswer': correctAnswer,
      'duration': duration,
      'questionCount': questionCount,
    };
  }


  factory ExamQuestionModel.fromJson(Map<String, dynamic> json) {

    final int idValue = json['_id'] != null
        ? (json['_id'] is int
        ? json['_id'] as int
        : int.tryParse(json['_id'].toString()) ?? 0)
        : 0;


    final List<AnswerModel> answersList = json['answers'] != null && json['answers'] is List
        ? (json['answers'] as List)
        .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
        .toList()
        : [];


    final int durationValue = json['exam'] != null && json['exam']['duration'] != null
        ? (json['exam']['duration'] is int
        ? json['exam']['duration'] as int
        : int.tryParse(json['exam']['duration'].toString()) ?? 0)
        : 0;

    final int questionCountValue =
    json['exam'] != null && json['exam']['numberOfQuestions'] != null
        ? (json['exam']['numberOfQuestions'] is int
        ? json['exam']['numberOfQuestions'] as int
        : int.tryParse(json['exam']['numberOfQuestions'].toString()) ?? 0)
        : 0;

    return ExamQuestionModel(
      id: idValue,
      question: json['question'] ?? 'Unknown question',
      answers: answersList,
      // استخدام الحقل "correct" من JSON لتحديد المفتاح الصحيح
      correctAnswer: json['correct'] ?? '',
      duration: durationValue,
      questionCount: questionCountValue,
    );
  }
}
