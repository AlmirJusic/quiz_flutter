import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}
//ili ovo
//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is the top color in a rainbow?',
      'answers': [
        {'text': 'Black', 'score': 0},
        {'text': 'Red', 'score': 1},
        {'text': 'Green', 'score': 0},
        {'text': 'White', 'score': 0},
      ],
    },
    {
      'questionText': 'Which animal is called "King of Jungle" ?',
      'answers': [
        {'text': 'Rabbit', 'score': 0},
        {'text': 'Snake', 'score': 0},
        {'text': 'Elephant', 'score': 0},
        {'text': 'Lion', 'score': 1},
      ],
    },
    {
      'questionText': 'In which direction does the sunrise?',
      'answers': [
        {'text': 'East', 'score': 1},
        {'text': 'West', 'score': 0},
        {'text': 'North', 'score': 0},
        {'text': 'South', 'score': 0},
      ],
    },
    {
      'questionText': 'Which country is home to the kangaroo?',
      'answers': [
        {'text': 'America', 'score': 0},
        {'text': 'Africa', 'score': 0},
        {'text': 'Australia', 'score': 1},
        {'text': 'South Africa', 'score': 0},
      ],
    },
    {
      'questionText':
          'Who found the concept of “Gravitation” for the first time?',
      'answers': [
        {'text': 'Albert Einstein', 'score': 0},
        {'text': 'Charles Darwin', 'score': 0},
        {'text': 'V. Raman', 'score': 0},
        {'text': 'Issac Newton', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }

    _totalScore += score;
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first application!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
