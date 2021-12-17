import 'package:expenses_app/Widgets/new_transaction.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Models/transaction.dart';
import 'Widgets/transaction_list.dart';
import "Widgets/chart.dart";

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([
  //  DeviceOrientation.portraitUp,
  //  DeviceOrientation.portraitDown,
  //]).then((_) {
  runApp(new MyApp());
  //});
}

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
    //Transaction(id: "t1", title: "New Shoes", amount: 150.99, date: (DateTime.now().subtract(Duration(days: 0)))),
    //Transaction(id: "t2", title: "Poke Bowl", amount: 17.54, date: (DateTime.now().subtract(Duration(days: 1)))),
    //Transaction(id: "t2", title: "AAAA", amount: 10, date: (DateTime.now().subtract(Duration(days: 2)))),
    //Transaction(id: "t2", title: "BBBB", amount: 24, date: (DateTime.now().subtract(Duration(days: 3)))),
    //Transaction(id: "t2", title: "CCCC", amount: 9.99954, date: (DateTime.now().subtract(Duration(days: 4)))),
    //Transaction(id: "t2", title: "DDDD", amount: 17.5441, date: (DateTime.now().subtract(Duration(days: 5)))),
    //Transaction(id: "t2", title: "EEEE", amount: 17.5469, date: (DateTime.now().subtract(Duration(days: 6)))),
    //Transaction(id: "t2", title: "FFFF", amount: 17.54, date: (DateTime.now().subtract(Duration(days: 7)))),
    //Transaction(id: "t2", title: "GGGG", amount: 17.54, date: (DateTime.now().subtract(Duration(days: 8)))),
    //Transaction(id: "t2", title: "HHHH", amount: 17.54, date: (DateTime.now().subtract(Duration(days: 2)))),
    //Transaction(id: "t2", title: "IIII", amount: 17.54, date: (DateTime.now().subtract(Duration(days: 1)))),
  ];

  List<Transaction> get recentTransactions {
    return transactions.where((element) => element.date.isAfter(DateTime.now().subtract(Duration(days: 7)))).toList();
  }

  bool _showChart = false;

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
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text("Simple Transactions App"),
      actions: [IconButton(onPressed: () => StartAddNewTransaction(context), icon: Icon(Icons.add))],
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Show Chart"),
                Switch(
                    value: _showChart,
                    onChanged: (newVal) {
                      setState(() {
                        _showChart = newVal;
                      });
                    }),
              ],
            ),
          if (_showChart || !isLandscape)
            Container(
              child: Chart(recentTransactions),
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * (isLandscape ? 0.7 : 0.3),
            ),
          if (!_showChart || !isLandscape)
            Container(
              child: TransacionList(transactions, _deleteTransaction),
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.7,
            ),
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

  void _deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
  }
}
