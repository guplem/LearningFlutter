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
      child: transactions.isEmpty
          ? Column(children: [
              SizedBox(height: 20,), // Empty space
              Text("No transactions added yet"),
              SizedBox(height: 50,), // Empty space
              Container(height: 200,child: Image.asset("assets/images/waiting.png", fit: BoxFit.cover,))
            ])
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).colorScheme.primaryVariant,
                          width: 2,
                        )),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "\$ ${transactions[index].amount.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
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
