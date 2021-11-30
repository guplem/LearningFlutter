import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText; // With every update, flutter will create a new one

  Question (this.questionText); // Constructor

  @override
  Widget build(BuildContext context) {
    return Text("Question from C widget: " + questionText);
  }
}
