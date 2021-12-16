import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  Function(String title, double amount) addNewTransactionFunction;

  NewTransaction(this.addNewTransactionFunction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => _SubmitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _SubmitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text("No Date Chosen"),
                  TextButton(
                    onPressed: () {},
                    child: const Text("ChooseDate",),
                  )
                ],
              ),
            ),
            ElevatedButton(onPressed: _SubmitData, child: Text("Add Transaction"))
          ],
        ),
      ),
    );
  }

  _SubmitData() {
    String enteredText = titleController.text;
    double enteredAmount = double.parse(amountController.text);

    if (enteredText.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewTransactionFunction(enteredText, enteredAmount);

    // So the NewTransaction widget screen is closed automatically
    Navigator.pop(context);
  }
}
