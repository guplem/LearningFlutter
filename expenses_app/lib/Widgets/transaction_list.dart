import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import "../Models/transaction.dart";

class TransacionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransacionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: transactions.map<Widget>((tx) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    )),
                padding: EdgeInsets.all(10),
                child: Text(
                  "\$ ${tx.amount}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat("dd MMMM yyyy, HH:mm").format(tx.date), //DateFormat.yMMMMd("en_US").format(tx.date), // Another option
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
