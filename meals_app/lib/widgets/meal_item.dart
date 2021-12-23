import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key? key, required this.meal, required this.removeMeal }) : super(key: key);

  final Meal meal;
  final Function(String mealId) removeMeal;

  selectMeal(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_) {
        return MealDetailScreen(meal: meal);
      },
    )).then((value) {
      if (value != null) {
        removeMeal(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    width: 220,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6), // Empty space
                      Text("${meal.duration}")
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6), // Empty space
                      Text("${meal.complexity.toString().split('.').last}")
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6), // Empty space
                      Text("${meal.affordability.toString().split('.').last}")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
