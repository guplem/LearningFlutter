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
  static const _questions = [
    // List of Maps
    {
      // This is a Map<String, Object> (it can be any type)
      "questionText": "What's your favourite color?",
      "answers": ["Black", "Red", "Green", "White"]
    },
    {
      "questionText": "What's your favourite pet?",
      "answers": ["Dog", "Cat", "Hedgehog"]
    },
  ];

  void _answerQuestion(){
    setState(() {
      _questionIndex++;
      if (_questionIndex >= _questions.length)
        _questionIndex = 0;
    });
    print ("Answer chosen!");
    print("New question: " + _questions.elementAt(_questionIndex)["questionText"].toString());
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
            Question(_questions[_questionIndex]["questionText"].toString()),
            // The "..." takes the values of the list and puts them in the parent list (instead of putting a list in the "children" list).
            ...(_questions[_questionIndex]["answers"] as List<String>).map(// "map" calls a method for each element in the list.
                (answer) {
              // The method has as parameter the element of the list
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
