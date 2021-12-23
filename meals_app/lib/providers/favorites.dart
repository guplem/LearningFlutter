import 'package:flutter/material.dart';

class Favorites with ChangeNotifier {

  List<String> _favorites = [];

  List<String> get favorites {
    return [..._favorites]; // To return a clone, not a pointer to the main/original list
  }

  void toggleFavorite(String id){

    // BE SURE TO USE THE PROPER VARIABLE. "_favorites", not "favorites" (that returns a clone)
    if (_favorites.contains(id)) {
      print("REMOVED $id");
      _favorites.remove(id);
    } else {
      print("ADDED $id");
      _favorites.add(id);
    }

    notifyListeners(); // IMPORTANT!
  }

}