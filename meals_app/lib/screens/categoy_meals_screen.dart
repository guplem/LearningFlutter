// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/models/UserSettings.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryMealsScreen({Key? key, required this.categoryId, required this.categoryTitle}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  late List<Meal> displayedMeals;

  @override
  void initState() {

    displayedMeals = DUMMY_MEALS.where((meal) {
      if (!meal.categories.contains(widget.categoryId))
        return false;
      if (!meal.isGlutenFree && UserSettings.instance.filters.glutenFree)
        return false;
      if (!meal.isLactoseFree && UserSettings.instance.filters.lactoseFree)
        return false;
      if (!meal.isVegan && UserSettings.instance.filters.vegan)
        return false;
      if (!meal.isVegetarian && UserSettings.instance.filters.vegetarian)
        return false;
      return true;
    }).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: displayedMeals[index], removeMeal: _removeMeal,);
        },
      ),
    );
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

}
