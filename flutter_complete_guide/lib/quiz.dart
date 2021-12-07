import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  Function(int) answerQuestion; // the parameters of the stored function must be defined in the variable type
  List<Map<String, Object>> questions;
  int questionIndex;

  Quiz({required this.answerQuestion, required this.questions, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]["questionText"] as String), // To avoid Null Safety issues
        // The "..." takes the values of the list and puts them in the parent list (instead of putting a list in the "children" list).
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>).map(// "map" calls a method for each element in the list.
            (answer) {
          // The method has as parameter the element of the list
          // With "() =>" we can use the parameterless callback calling a method with an argument
          return Answer(() => answerQuestion(answer["Score"] as int), answer["Text"] as String);
        }).toList()
      ],
    );
  }
}
