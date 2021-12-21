import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Map<String, Object>> _pages = [
    {
      "page": CategoriesScreen(),
      "appBarTitle": "Categories",
    },
    {
      "page": FavoritesScreen(),
      "appBarTitle": "Favorites",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]["appBarTitle"] as String)),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Categories", backgroundColor: Theme.of(context).colorScheme.primary),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites", backgroundColor: Colors.orangeAccent),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        // You must tell the tab bar which tab is selected so it visually updates
        type: BottomNavigationBarType.shifting, // BottomNavigationBarType.fixed --> Default mode, no switching colors neither disabling labels
      ),
      body: _pages[_selectedPageIndex]["page"] as Widget,
    );
  }

  _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
