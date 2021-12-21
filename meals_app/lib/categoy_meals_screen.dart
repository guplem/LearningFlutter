import 'package:flutter/material.dart';

class CategoryMealsSecreen extends StatelessWidget {
  const CategoryMealsSecreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Recipes"),
      ),
      body: Center(
        child: Text("CATEGOTY CONTENT"),
      ),
    );
  }
}
