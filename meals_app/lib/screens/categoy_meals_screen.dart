import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CategoryMealsSecreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryMealsSecreen({Key? key, required this.categoryId, required this.categoryTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return Text((categoryMeals[index].title));
        },
      ),
    );
  }
}
