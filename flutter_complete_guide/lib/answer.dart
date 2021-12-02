// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final VoidCallback callback;
  final String answerText;

  Answer(this.callback, this.answerText);

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: double.infinity,
        child: new ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            foregroundColor: MaterialStateProperty.all(Colors.white), // Text
          ),
          onPressed: callback,
          child: Text(answerText),
        ));
  }
}
