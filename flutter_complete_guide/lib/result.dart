import 'package:flutter/cupertino.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result({required this.resultScore});

  String get resultPhrase {
    String resultText = "You did it!";

    if (resultScore <= 8) {
      resultText += "\n\nYou are awesome and innocent!";
    } else if (resultScore <= 12) {
      resultText += "\n\nNot bad...";
    } else if (resultScore <= 16) {
      resultText += "\n\nYou are cool";
    } else {
      resultText += "\n\nYou are so bad... I love it!";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
