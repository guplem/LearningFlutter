import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/UserSettings.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites.dart';
import 'package:meals_app/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    // Another way of referencing and subscribing to a provider.
    //    More ways:
    //    - https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100276
    //    - https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100282
    final favoritesProvider = Provider.of<Favorites>(context /*,listen: false  -> In case no listening/updates are desired*/);


    final List<Meal> displayedMeals = DUMMY_MEALS.where((element) {
      return favoritesProvider.favorites.contains(element.id);
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
