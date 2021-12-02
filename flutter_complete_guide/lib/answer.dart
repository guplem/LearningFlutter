// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final VoidCallback callback;

  Answer(this.callback);

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
          child: Text("Answer 1"),
        ));
  }
}
