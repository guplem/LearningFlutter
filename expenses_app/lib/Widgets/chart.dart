import 'package:expenses_app/Models/transaction.dart';
import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../Models/transaction.dart";

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      //recentTransactions.forEach((transaction) { // Another way of doing a forEach
      for (Transaction transaction in recentTransactions) {
        if (transaction.date.day == weekDay.day && transaction.date.month == weekDay.month && transaction.date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }
      //});

      return {"day": DateFormat.E().format(weekDay).substring(0, 1), "amount": totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Column(
        children: groupedTransactionValues.map((data) {
          return Text("{$data['day']}: ${data['amount']}");
        }).toList(),
      ),
    );
  }
}
