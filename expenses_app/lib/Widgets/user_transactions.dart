import 'package:expenses_app/Models/transaction.dart';
import 'package:expenses_app/Widgets/new_transaction.dart';
import 'package:expenses_app/Widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> transactions = [
    Transaction(id: "t1", title: "New Shoes", amount: 39.99, date: DateTime.now()),
    Transaction(id: "t2", title: "Poke Bowl", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "AAAA", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "BBBB", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "CCCC", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "DDDD", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "EEEE", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "FFFF", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "GGGG", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "HHHH", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "IIII", amount: 17.54, date: (DateTime.now())),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Card(
            color: Colors.cyan,
            child: Text("CHART"),
            elevation: 5 /*shadow*/,
          ),
          NewTransaction(_addNewTransaction),
          TransacionList(transactions),
        ],
    );
  }

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());

    setState(() {
      transactions.add(newTransaction);
    });
  }
  
}
