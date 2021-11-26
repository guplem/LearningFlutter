import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  void answerQuestion(){
    print ("Answer chosen!");
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
            Text("Question:"),
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
              onPressed: answerQuestion, //Be aware, do not pass the result of the function ("answerQuestion()") but the pointer to the function ("answerQuestion")
            ),
          ],
        ),
      ),
    );
  }
}
