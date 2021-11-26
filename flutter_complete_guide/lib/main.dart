import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
              onPressed: null,
            ),
            ElevatedButton( //Previously (deprecated) was RaisedButton
              child: Text("Answer 2"),
              onPressed: null,
            ),
            ElevatedButton( //Previously (deprecated) was RaisedButton
              child: Text("Answer 4"),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
