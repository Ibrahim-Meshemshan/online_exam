import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/theme_manager.dart';
import 'package:online_exam/feature/app/explore/presentation/cubit/question/question_cubit.dart';
import 'package:online_exam/feature/app/explore/presentation/cubit/question/question_state.dart';

class QuestionScreen extends StatefulWidget {
  static const String routeName = 'question_Screen';

  @override
  _QuestionScreen createState() => _QuestionScreen();
}

class _QuestionScreen extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuestionCubit>(context, listen: false).fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<QuestionCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam"),
        actions: [
          Icon(Icons.timer_outlined),
          BlocBuilder<QuestionCubit, QuestionState>(
            builder: (context, state) {
              return Text(
                "${cubit.timeLeft.toStringAsFixed(0)}.00 ",
                style: const TextStyle(fontSize: 16),
              );
            },
          ),
        ],
      ),
      body: BlocConsumer<QuestionCubit, QuestionState>(
        listener: (context, state) {
          if (state.status == Status.completed) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("نتيجتك"),
                content:
                Text("Your score: ${state.finalScore.toStringAsFixed(2)}%"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("حسنًا"),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == Status.error) {
            return Center(
                child: Text("حدث خطأ: ${state.exception?.toString()}"));
          } else if (state.examQuestion == null ||
              state.examQuestion!.isEmpty) {
            return const Center(child: Text("لا توجد أسئلة متاحة."));
          }

          final question = state.examQuestion![cubit.currentIndex];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Question ${cubit.currentIndex + 1} of ${state.examQuestion!.length}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  value: cubit.timeLeft / 30,
                  backgroundColor: Colors.grey[300],
                  valueColor:
                  AlwaysStoppedAnimation<Color>(ThemeManager.buttonColor),
                ),
                const SizedBox(height: 10),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: Text(
                    question.question ?? "السؤال غير متاح",
                    key: ValueKey<int>(cubit.currentIndex),
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: question.options == null || question.options!.isEmpty
                      ? const Center(child: Text("لا توجد خيارات لهذا السؤال."))
                      : ListView.builder(
                    itemCount: question.options!.length,
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: cubit.selectedAnswer == index
                              ? Colors.lightBlueAccent.withOpacity(0.5)
                              : Colors.white,

                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: RadioListTile<int>(
                          title: Text(
                            question.options?[index] ?? "خيار غير متاح",
                            style: const TextStyle(fontSize: 16),
                          ),
                          value: index,
                          groupValue: cubit.selectedAnswer,
                          onChanged: (int? value) {
                            if (value != null) {
                              cubit.selectAnswer(value);
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeManager.buttonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          padding: EdgeInsets.all(14.sp),
                        ),
                        onPressed: cubit.currentIndex > 0
                            ? cubit.previousQuestion
                            : null,
                        child: Text(
                          "Back",
                          style: ThemeManager.appTheme.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeManager.buttonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          padding: EdgeInsets.all(14.sp),
                        ),
                        onPressed: cubit.selectedAnswer != -1
                            ? cubit.nextQuestion
                            : null,
                        child: Text(
                          "Next",
                          style: ThemeManager.appTheme.textTheme.titleSmall
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
