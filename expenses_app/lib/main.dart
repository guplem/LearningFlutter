import 'package:expenses_app/Widgets/new_transaction.dart';

import 'package:flutter/material.dart';

import 'Models/transaction.dart';
import 'Widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.brown),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(id: "t1", title: "New Shoes", amount: 39.99, date: DateTime.now()),
    Transaction(id: "t2", title: "Poke Bowl", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "AAAA", amount: 10, date: (DateTime.now())),
    Transaction(id: "t2", title: "BBBB", amount: 24, date: (DateTime.now())),
    Transaction(id: "t2", title: "CCCC", amount: 9.99954, date: (DateTime.now())),
    Transaction(id: "t2", title: "DDDD", amount: 17.5441, date: (DateTime.now())),
    Transaction(id: "t2", title: "EEEE", amount: 17.5469, date: (DateTime.now())),
    Transaction(id: "t2", title: "FFFF", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "GGGG", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "HHHH", amount: 17.54, date: (DateTime.now())),
    Transaction(id: "t2", title: "IIII", amount: 17.54, date: (DateTime.now())),
  ];

  // To create a floating window with a widget
  void StartAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builderContext) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Transactions App"),
        actions: [IconButton(onPressed: () => StartAddNewTransaction(context), icon: Icon(Icons.add))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Center(child: Text("CHART")),
            elevation: 5 /*shadow*/,
          ),
          TransacionList(transactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () => StartAddNewTransaction(context), child: Icon(Icons.add)),
    );
  }

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());

    setState(() {
      transactions.add(newTransaction);
    });
  }
}
