import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  int elementIndex;
  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.elementIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[elementIndex]['questionText'],
        ),
        ...(questions[elementIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
