import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import "../Models/transaction.dart";

class TransacionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransacionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      // ListView needs to be in a widget that defines the height (like the container)
      child: ListView.builder(
        itemBuilder: (context, index) {
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
                    "\$ ${transactions[index].amount.toStringAsFixed(2)}",
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
                      transactions[index].title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat("dd MMMM yyyy, HH:mm").format(transactions[index].date), //DateFormat.yMMMMd("en_US").format(tx.date), // Another option
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
