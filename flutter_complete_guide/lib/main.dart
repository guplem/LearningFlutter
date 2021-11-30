import "package:flutter/material.dart";

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
            Text("Question: " + _questions.elementAt(_questionIndex)),
            ElevatedButton( //Previously (deprecated) was RaisedButton
              child: Text("Answer 1"),
              onPressed: _answerQuestion, //Be aware, do not pass the result of the function ("answerQuestion()") but the pointer to the function ("answerQuestion")
            ),
            ElevatedButton( //Previously (deprecated) was RaisedButton
              child: Text("Answer 2"),
              onPressed: _answerQuestion, //Be aware, do not pass the result of the function ("answerQuestion()") but the pointer to the function ("answerQuestion")
            ),
            ElevatedButton( //Previously (deprecated) was RaisedButton
              child: Text("Answer 4"),
              onPressed: () {
                print("Executing a function that can only be executed from the button and nowhere else. This is called an 'anonymous function.'");
              },
            ),
          ],
        ),
      ),
    );
  }
}
