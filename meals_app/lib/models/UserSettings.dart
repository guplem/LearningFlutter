class UserSettings {

  static final UserSettings instance = UserSettings();

  final filters = Filters();

  final List<String> favorites = <String>[];

  ToggleFavorite(String id) {
    if (favorites.contains(id))
      favorites.remove(id);
    else
      favorites.add(id);
  }

}

class Filters {

  bool glutenFree = false;
  bool vegan = false;
  bool vegetarian = false;
  bool lactoseFree = false;

}