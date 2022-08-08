import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //const Answer({Key? key}) : super(key: key);
  final String answerText;
  final Function() x;

   Answer( this.answerText, this.x) ;

  @override
  Widget build(BuildContext context) {

            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 7.0,),
              child: ElevatedButton(
                onPressed:x,
                child: Text(
                  answerText,
                  style: const TextStyle(
                    fontSize: 25.0,
                  ),
                ) ,
              ),
            );
  }
}
