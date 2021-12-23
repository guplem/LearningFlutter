import 'package:flutter/material.dart';
import 'package:meals_app/models/UserSettings.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites.dart';
import 'package:provider/provider.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                widget.meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            BuildSectionTitle(context, "Ingredients"),
            BuildSectionContainer(
              context,
              ListView.builder(
                itemCount: widget.meal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(widget.meal.ingredients[index]),
                  ),
                ),
              ),
            ),
            BuildSectionTitle(context, "Steps"),
            BuildSectionContainer(
              context,
              ListView.builder(
                itemCount: widget.meal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          "# ${index + 1}",
                        ),
                      ),
                      title: Text(widget.meal.steps[index]),
                    ),
                    if (index < widget.meal.steps.length - 1) Divider(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Calls "context.watch" to make this rebuild when the provider changes.
        child: Icon(context.watch<Favorites>().favorites.contains(widget.meal.id) ? Icons.star : Icons.star_border),
        // Calls "context.read" instead of "context.watch" so that it does not rebuild when it is updated
        onPressed: () => setState(() => context.read<Favorites>().toggleFavorite(widget.meal.id)),
      ),
    );
  }

  Widget BuildSectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget BuildSectionContainer(BuildContext ctx, Widget child) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: MediaQuery.of(ctx).size.width,
      child: child,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
