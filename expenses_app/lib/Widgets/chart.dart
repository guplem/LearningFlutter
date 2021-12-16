import 'package:expenses_app/Models/transaction.dart';
import 'package:expenses_app/Widgets/chart_bar.dart';
import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../Models/transaction.dart";
import "../Widgets/chart_bar.dart";

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

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + (element["amount"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return ChartBar(
            label: data['day'] as String, spendingAmount: data['amount'] as double, totalSpending: totalSpending); //Text("{$data['day']}: ${data['amount']}");
        }).toList(),
      ),
    );
  }
}
