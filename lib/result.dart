import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resultHandler;
  Result(this.resultScore, this.resultHandler);

  String get resultPharase {
    var resultText = "You\'ve Made it!";
    if (resultScore <= 8) {
      resultText = "You're awesome!";
    } else if (resultScore >= 15) {
      resultText = "You're fanthastic";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(
          resultPharase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        OutlinedButton(
          onPressed: () => resultHandler(),
          child: Text('Reset'),
        ),
      ]),
    );
  }
}
