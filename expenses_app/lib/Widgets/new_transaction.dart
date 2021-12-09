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
            TextField(decoration: const InputDecoration(labelText: "Title"), controller: titleController,),
            TextField(decoration: const InputDecoration(labelText: "Amount"), controller: amountController,),
            TextButton(onPressed: () {
              addNewTransactionFunction(titleController.text, double.parse(amountController.text));
            }, child: const Text("Add Transaction"))
          ],
        ),
      ),
    );
  }
}
