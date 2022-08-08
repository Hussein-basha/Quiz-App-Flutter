import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_cubit.dart';

class Question extends StatelessWidget {
  //Question({Key? key}) : super(key: key);
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {

            return Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10.0),
              child: Text(
                questionText,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: QuizCubit.get(context).isSwitched == false ? Colors.black : Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            );
  }
}
