import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s yout favourite color?',
      'answers': [
        {'text': 'Black', 'score': 100},
        {'text': 'red', 'score': 5},
        {'text': 'yellow', 'score': 15},
        {'text': 'blue', 'score': 10}
      ]
    },
    {
      'questionText': 'what\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 21},
        {'text': 'Cat', 'score': 26},
        {'text': 'Dog', 'score': 27},
        {'text': 'Cow', 'score': 1},
      ]
    },
    {
      'questionText': 'what\'s your favourite Icecream falvor?',
      'answers': [
        {'text': 'vanila', 'score': 89},
        {'text': 'Chocolate', 'score': 19},
        {'text': 'Strawberry', 'score': 8},
        {'text': 'Banana', 'score': 75},
      ]
    }
  ];
  var _elementIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _elementIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _elementIndex = _elementIndex + 1;
    });
    print(_elementIndex);
    if (_elementIndex < _questions.length) {
      print("We\'re done with the qestions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FLutter Tutorial Chapter01'),
          centerTitle: true,
        ),
        body: _elementIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestions,
                elementIndex: _elementIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
