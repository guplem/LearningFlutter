import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Text("Meal detail screen: ${meal.id}"),
    );
  }
}
