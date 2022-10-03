import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get reusltPhrase {
    String resultText;

    if (resultScore >= 3) {
      resultText = 'You are awesome!  \n' + resultScore.toString() + '/5';
    } else {
      resultText = 'You are so bad!  ' + resultScore.toString() + '/5';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          reusltPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          style: TextButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: resetQuiz,
          child: Text('Restart Quiz!'),
        )
      ],
    ));
  }
}
