import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText; // With every update, flutter will create a new one

  Question(this.questionText); // Constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // as much as possible
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
