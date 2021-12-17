import "package:flutter/material.dart";
import 'package:intl/intl.dart';

import "../Models/transaction.dart";

class TransacionList extends StatelessWidget {
  final List<Transaction> transactions;
  void Function(String id) deleteTransaction;

  TransacionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      // ListView MUST be in a widget that defines the height (like the container)
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
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(padding: EdgeInsets.all(6), child: FittedBox(child: Text("\$${transactions[index].amount.toStringAsFixed(2)}"))),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(icon: Icon(Icons.delete), color: Theme.of(context).errorColor, onPressed: () => deleteTransaction(transactions[index].id),),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
