import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class NewTransaction extends StatefulWidget {
  Function(String title, double amount, DateTime date) addNewTransactionFunction;

  NewTransaction(this.addNewTransactionFunction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom, // Keyboard area
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField( // CupertinoTextField can be used. It uses a placeholder instead of decoration
                decoration: InputDecoration(labelText: "Title"),
                controller: _titleController,
                onSubmitted: (_) => _SubmitData(),
              ),
              TextField( // CupertinoTextField can be used. It uses a placeholder instead of decoration
                decoration: InputDecoration(labelText: "Amount"),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _SubmitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(child: Text(_selectedDate == null ? "No Date Chosen" : "Picked Date:" + DateFormat.yMd().format(_selectedDate!))),
                    CupertinoButton(
                      onPressed: _presentDatePicker,
                      child: const Text(
                        "ChooseDate",
                      ),
                    )
                  ],
                ),
              ),
              CupertinoButton(color: Theme.of(context).colorScheme.primary,onPressed: _SubmitData, child: Text("Add Transaction"))
            ],
          ),
        ),
      ),
    );
  }

  _SubmitData() {
    if (_amountController.text.isEmpty || _titleController.text.isEmpty || double.parse(_amountController.text) <= 0 || _selectedDate == null) {
      return;
    }

    String enteredText = _titleController.text;
    double enteredAmount = double.parse(_amountController.text);

    widget.addNewTransactionFunction(enteredText, enteredAmount, _selectedDate!);

    // So the NewTransaction widget screen is closed automatically
    Navigator.pop(context);
  }
}
