import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  Function(String title, double amount) addNewTransactionFunction;

  NewTransaction(this.addNewTransactionFunction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => SubmitData(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => SubmitData(),
            ),
            TextButton(onPressed: SubmitData, child: const Text("Add Transaction"))
          ],
        ),
      ),
    );
  }

  SubmitData() {
    String enteredText = titleController.text;
    double enteredAmount = double.parse(amountController.text);

    if (enteredText.isEmpty || enteredAmount <= 0){
      return;
    }

    addNewTransactionFunction(enteredText, enteredAmount);
  }
}
