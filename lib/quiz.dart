import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz_cubit.dart';

class Quiz extends StatelessWidget {
  //const Quiz({Key? key}) : super(key: key);

  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function(int s) answerQuestion;

  Quiz(this.question , this.questionIndex , this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question((QuizCubit.get( context).question[QuizCubit.get( context).questionIndex]['questionText']).toString()),
        ...(QuizCubit.get( context).question[QuizCubit.get( context).questionIndex]['answers'] as List<Map<String , Object>>).map((element)
        {
          return Answer(element['text'].toString(),
                  () => QuizCubit.get( context).answerQuestion(int.parse(element['score'].toString())));
        }).toList(),
      ],
    );
  }
}
