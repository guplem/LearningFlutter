import "dart:io";

import 'package:expenses_app/Widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
    return CupertinoApp(
      localizationsDelegates: const [ // To be able to use MaterialWidgets in CupertinoApp
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: 'Personal Expenses',
      theme: const CupertinoThemeData(
        primaryColor: Colors.green,
        primaryContrastingColor: Colors.brown,
        textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(
              fontFamily: "Quicksand",
            ),
            navLargeTitleTextStyle : TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            actionTextStyle: TextStyle(fontWeight: FontWeight.bold)),
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
    showCupertinoModalPopup(
        context: context,
        builder: (builderContext) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    final bool isLandscape = _mediaQuery.orientation == Orientation.landscape;

    final PreferredSizeWidget appBar = CupertinoNavigationBar(
      middle: const Text("Simple Transactions App"),
      trailing: CupertinoButton(padding: EdgeInsets.all(0.0), onPressed: () => StartAddNewTransaction(context), child: Icon(CupertinoIcons.add)),
    );

    return CupertinoPageScaffold(
      navigationBar: appBar as ObstructingPreferredSizeWidget,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Show Chart"),
                  Switch.adaptive(
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
                height: (_mediaQuery.size.height - appBar.preferredSize.height - _mediaQuery.padding.top) * (isLandscape ? 0.7 : 0.3),
              ),
            if (!_showChart || !isLandscape)
              Container(
                child: TransacionList(transactions, _deleteTransaction),
                height: (_mediaQuery.size.height - appBar.preferredSize.height - _mediaQuery.padding.top) * 0.7,
              ),
          ],
        ),
      ),

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
