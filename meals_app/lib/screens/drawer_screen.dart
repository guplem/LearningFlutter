import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              "Cooking Up!",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(height: 20),
          buildDrawerListItem(Icons.restaurant, "Categories", () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
              return TabsScreen();
            }));
          }),
          buildDrawerListItem(Icons.settings, "Settings", () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return FiltersScreen();
            }));
          }),
        ],
      ),
    );
  }

  buildDrawerListItem(IconData icon, String label, VoidCallback onTapFunction) { // Important: https://stackoverflow.com/a/64515624/7927429
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(fontFamily: "RobotoCondensed", fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTapFunction,
    );
  }
}
