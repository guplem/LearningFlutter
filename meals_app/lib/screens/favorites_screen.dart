import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/UserSettings.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Meal> displayedMeals = DUMMY_MEALS.where((element) {
      return UserSettings.instance.favorites.contains(element.id);
    }).toList();

    return Center(
        child: (displayedMeals.isEmpty)
            ? const Text("You have no favorites yet - Start adding some!")
            : ListView.builder(
                itemCount: displayedMeals.length,
                itemBuilder: (ctx, index) {
                  return MealItem(meal: displayedMeals[index]);
                },
              ));
  }
}
