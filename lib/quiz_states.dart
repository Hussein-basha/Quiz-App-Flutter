abstract class QuizStates{}

class QuizInitialState extends QuizStates{}

class QuizSuccessState extends QuizStates
{
  final int answerState;

  QuizSuccessState(this.answerState);
}

class QuizErrorState extends QuizStates{}

class QuizChangeState extends QuizStates{}