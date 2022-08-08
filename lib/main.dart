import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/quiz_cubit.dart';
import 'package:quiz_app/quiz_states.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //var cubit = QuizCubit.get( context);
    return BlocProvider(
      create: (context) => QuizCubit(),
      child: BlocConsumer<QuizCubit, QuizStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Quiz App',
                  style: TextStyle(
                    color: QuizCubit.get(context).isSwitched == false ? Colors.white : Colors.black,
                  ),
                ),
                backgroundColor: Colors.deepPurpleAccent,
                actions: [
                  Switch(
                    value: QuizCubit.get(context).isSwitched,
                    onChanged: QuizCubit.get(context).on_Change,
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.black,
                  ),
                ],
              ),
              body: Container(
                color: QuizCubit.get(context).isSwitched == false ? Colors.white : Colors.black,
                child: QuizCubit.get(context).questionIndex <
                        QuizCubit.get(context).question.length
                    ? Quiz(
                        QuizCubit.get(context).question,
                        QuizCubit.get(context).questionIndex,
                        QuizCubit.get(context).answerQuestion)
                    : Result(QuizCubit.get(context).resetQuiz,
                        QuizCubit.get(context).totalScore),
              ),
              // floatingActionButton: FloatingActionButton(
              //   child: Icon(Icons.arrow_back ,color: QuizCubit.get(context).w,size: 40.0,),
              //   onPressed:()
              //   {
              //     if(QuizCubit.get(context).questionIndex == 1) QuizCubit.get(context).totalScore -= num0;
              //     if(QuizCubit.get(context).questionIndex == 2) QuizCubit.get(context).totalScore -= num1;
              //     if(QuizCubit.get(context).questionIndex == 3) QuizCubit.get(context).totalScore -= num2;
              //     if(QuizCubit.get(context).questionIndex > 0)
              //       {
              //
              //       }
              //
              //     print('questionIndex = ${QuizCubit.get(context).questionIndex}');
              //     print('num0 = ${QuizCubit.get(context).num0}');
              //     print('num1 = ${QuizCubit.get(context).num1}');
              //     print('num2 = ${QuizCubit.get(context).num2}');
              //     print('totalScore = ${QuizCubit.get(context).totalScore}');
              //   },
              // ),
            ),
          );
        },
      ),
    );
  }
}
