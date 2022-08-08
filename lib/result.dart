import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/quiz_cubit.dart';

class Result extends StatelessWidget {
  //const Result({Key? key}) : super(key: key);

  final Function() Restart;
  final int resultScore;
  Result(this.Restart , this.resultScore);

  String get resultPhrase
  {
    String resultText;
    if(resultScore >= 70)
      {
        resultText = 'You Are awesome !';
      }
    else if(resultScore >= 40)
    {
      resultText = 'Pretty Likable !';
    }
    else
      {
        resultText = 'You Are So Bad !';
      }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        width: double.infinity,
        color: Colors.black26,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
             Text(
              'Your Score Is : $resultScore',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: QuizCubit.get(context).isSwitched == false ? Colors.black : Colors.white,
              ),
               textAlign: TextAlign.center,
            ),
             Text(
              resultPhrase,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: QuizCubit.get(context).isSwitched == false ? Colors.black : Colors.white,
              ),
            ),
            const SizedBox(height: 20.0,),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(15.0,),
              ),
              child: TextButton(
                  onPressed: Restart,
                  child: const Text(
                    'Restart The App',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
