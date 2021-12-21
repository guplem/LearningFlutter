import 'package:flutter/material.dart';
import 'package:meals_app/screens/drawer_screen.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filters")),
      drawer: DrawerScreen(),
      body: Center(
        child: Text("Filters Screen"),
      ),
    );
  }
}
