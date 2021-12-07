import "package:flutter/material.dart";
import 'package:flutter_complete_guide/quiz.dart';

import "./quiz.dart";
import "./result.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
    // List of Maps
    {
      // This is a Map<String, Object> (it can be any type)
      "questionText": "What's your favourite color?",
      "answers": [
        {"Text": "Black", "Score": 10},
        {"Text": "Red", "Score": 5},
        {"Text": "Green", "Score": 3},
        {"Text": "White", "Score": 1}
      ]
    },
    {
      "questionText": "What's your favourite pet?",
      "answers": [
        {"Text": "Dog", "Score": 6},
        {"Text": "Cat", "Score": 1},
        {"Text": "Hedgehog", "Score": 10}
      ]
    },
  ];
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      // When this is updated, the app is "rebuilt"
      _questionIndex++;
    });

    print("Answer chosen!");
    print("New question: " + _questions.elementAt(_questionIndex)["questionText"].toString());

    if (_questionIndex < _questions.length) {
      print("There are more questions.");
    } else {
      print("There are no more questions.");
    }
  }

  void _resetQuiz(){
    setState(() {
      // When this is updated, the app is "rebuilt"
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello World!"),
        ),
        body: (_questionIndex < _questions.length) // You can use boolean expressions during the widgets construction
            ? Quiz(answerQuestion: _answerQuestion, questions: _questions, questionIndex: _questionIndex)
            : Result(resultScore: _totalScore, resetFunction: _resetQuiz),
      ),
    );
  }
}
