import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }

}

class MyAppState extends State<MyApp> {

  var questionIndex = 0;
  var questions = [
    "What's your favourite color?",
    "What's your favourite animal?",
  ];

  void answerQuestion(){
    setState(() {
      questionIndex++;
      if (questionIndex >= questions.length)
        questionIndex = 0;
    });
    print ("Answer chosen!");
    print ("New question: " + questions.elementAt(questionIndex));
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
            Text("Question: " + questions.elementAt(questionIndex)),
            ElevatedButton( //Previously (deprecated) was RaisedButton
              child: Text("Answer 1"),
              onPressed: answerQuestion, //Be aware, do not pass the result of the function ("answerQuestion()") but the pointer to the function ("answerQuestion")
            ),
            ElevatedButton( //Previously (deprecated) was RaisedButton
              child: Text("Answer 2"),
              onPressed: answerQuestion, //Be aware, do not pass the result of the function ("answerQuestion()") but the pointer to the function ("answerQuestion")
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
