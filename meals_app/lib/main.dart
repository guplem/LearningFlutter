import 'package:flutter/material.dart';

import 'package:meals_app/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)), // (old body1): https://stackoverflow.com/a/60864190/7927429
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)), // (old body2): https://stackoverflow.com/a/60864190/7927429
              headline6: const TextStyle(fontSize: 20, fontFamily: "RobotoCondensed"), // (old Title): https://stackoverflow.com/a/60864190/7927429
            ),
      ),
      home: CategoriesScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
