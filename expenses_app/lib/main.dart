import 'package:expenses_app/Widgets/new_transaction.dart';

import 'package:flutter/material.dart';

import 'Models/transaction.dart';
import 'Widgets/transaction_list.dart';
import "Widgets/chart.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.brown),
        fontFamily: "Quicksand", // General text
        textTheme: const TextTheme(
            headline6: TextStyle(
              // Style for headline 6 (old Title): https://stackoverflow.com/a/60864190/7927429
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            button: TextStyle(fontWeight: FontWeight.bold)),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            // Title text in app bar
            fontFamily: "OpenSans",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
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
    Transaction(id: "t1", title: "New Shoes", amount: 150.99, date: (DateTime.now().subtract(Duration(days: 0)))),
    Transaction(id: "t2", title: "Poke Bowl", amount: 17.54, date: (DateTime.now().subtract(Duration(days: 1)))),
    Transaction(id: "t2", title: "AAAA", amount: 10, date: (DateTime.now().subtract(Duration(days: 2)))),
    Transaction(id: "t2", title: "BBBB", amount: 24, date: (DateTime.now().subtract(Duration(days: 3)))),
    Transaction(id: "t2", title: "CCCC", amount: 9.99954, date: (DateTime.now().subtract(Duration(days: 4)))),
    Transaction(id: "t2", title: "DDDD", amount: 17.5441, date: (DateTime.now().subtract(Duration(days: 5)))),
    Transaction(id: "t2", title: "EEEE", amount: 17.5469, date: (DateTime.now().subtract(Duration(days: 6)))),
    Transaction(id: "t2", title: "FFFF", amount: 17.54, date: (DateTime.now().subtract(Duration(days: 7)))),
    Transaction(id: "t2", title: "GGGG", amount: 17.54, date: (DateTime.now().subtract(Duration(days: 8)))),
    Transaction(id: "t2", title: "HHHH", amount: 17.54, date: (DateTime.now().subtract(Duration(days: 2)))),
    Transaction(id: "t2", title: "IIII", amount: 17.54, date: (DateTime.now().subtract(Duration(days: 1)))),
  ];

  List<Transaction> get recentTransactions {
    return transactions.where((element) => element.date.isAfter(DateTime.now().subtract(Duration(days: 7)))).toList();
  }

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
          Chart(recentTransactions),
          TransacionList(transactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () => StartAddNewTransaction(context), child: Icon(Icons.add)),
    );
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: date);

    setState(() {
      transactions.add(newTransaction);
    });
  }
}
