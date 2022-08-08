import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/quiz_states.dart';

class QuizCubit extends Cubit<QuizStates>
{
  QuizCubit() : super(QuizInitialState());

  static QuizCubit get(context) => BlocProvider.of(context);

  Color w = Colors.white;
  Color b = Colors.black;
  bool isSwitched = false;

  void resetQuiz()
  {
    questionIndex =0;
    emit(QuizSuccessState(questionIndex));
    totalScore = 0;
  }

  int totalScore = 0;
  final List<Map<String, Object>> question =
  [
    {
      'questionText' : 'What\'s Your Favorite Color ? ',
      'answers' : [{'text':'Black' , 'score':'10'} , {'text':'Green' , 'score':'20'}  ,
        {'text':'Blue' , 'score':'30'}  , {'text':'Yellow' , 'score':'40'} ],
    },
    {
      'questionText' : 'What\'s Your Favorite Animal ? ',
      'answers' : [{'text':'Rabbit' , 'score':'10'}  , {'text':'Tiger' , 'score':'20'}  ,
        {'text':'Elephant' , 'score':'30'}  , {'text':'Lion' , 'score':'40'} ],
    },
    {
      'questionText' : 'What\'s Your Favorite Instructor ? ',
      'answers' : [{'text':'Hussein 1' , 'score':'10'}  , {'text':'Hussein 2' , 'score':'20'}  ,
        {'text':'Hussein 3' , 'score':'30'}  , {'text':'Hussein 4' , 'score':'40'} ],
    },
  ];

  int questionIndex = 0;
  void answerQuestion(int score)
  {
    totalScore += score;
    questionIndex +=1;
    emit(QuizSuccessState(questionIndex));
    print(questionIndex);
    print(totalScore);
    print('Answer Chosen !');
  }

  void on_Change(value)
  {
    isSwitched = value ;
    print(isSwitched);
    // if(isSwitched == true)
    // {
    //   b = Colors.white; w = Colors.black;
    // }
    // if(isSwitched == false)
    // {
    //   b = Colors.black; w = Colors.white;
    // }
    emit(QuizChangeState());
  }
}
