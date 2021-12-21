import 'package:flutter/material.dart';

class CategoryMealsSecreen extends StatelessWidget {

  const CategoryMealsSecreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    String categoryId = routeArgs["id"] as String;
    String categoryTitle = routeArgs["title"] as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text("CATEGOTY CONTENT"),
      ),
    );
  }
}
