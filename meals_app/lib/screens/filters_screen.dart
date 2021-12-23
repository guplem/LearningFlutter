import 'package:flutter/material.dart';
import 'package:meals_app/models/UserSettings.dart';
import 'package:meals_app/screens/drawer_screen.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filters")),
      drawer: DrawerScreen(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text("Adjust your meal selection", style: Theme.of(context).textTheme.headline6,),
          ),
          const Divider(),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile("Gluten-Free", "Only include gluten-free meals.", UserSettings.instance.filters.glutenFree, (newValue) => setState(() => UserSettings.instance.filters.glutenFree = newValue)),
              buildSwitchListTile("Vegan", "Only include vegan meals.", UserSettings.instance.filters.vegan, (newValue) => setState(() => UserSettings.instance.filters.vegan = newValue)),
              buildSwitchListTile("Vegetarian", "Only include vegetarian meals.", UserSettings.instance.filters.vegetarian, (newValue) => setState(() => UserSettings.instance.filters.vegetarian = newValue)),
              buildSwitchListTile("Lactose-Free", "Only include lactose-free meals.", UserSettings.instance.filters.lactoseFree, (newValue) => setState(() => UserSettings.instance.filters.lactoseFree = newValue)),
            ],
          ))
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(String title, String subtitle, var currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
