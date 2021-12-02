import "package:flutter/material.dart";

import "./question.dart";
import "./answer.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }

}

class _MyAppState extends State<MyApp> {

  var _questionIndex = 0;
  final _questions = [
    "What's your favourite color?",
    "What's your favourite animal?",
  ];

  void _answerQuestion(){
    setState(() {
      _questionIndex++;
      if (_questionIndex >= _questions.length)
        _questionIndex = 0;
    });
    print ("Answer chosen!");
    print ("New question: " + _questions.elementAt(_questionIndex));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World!"),
        ),
        body: Column(
          children: [
            Question(_questions[_questionIndex]),
            Answer(_answerQuestion), // We pass the pointer to the function
            Answer(_answerQuestion),
            Answer(_answerQuestion),
          ],
        ),
      ),
    );
  }
}
