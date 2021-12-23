class UserSettings {

  static final UserSettings instance = UserSettings();

  final filters = Filters();

}

class Filters {

  bool glutenFree = false;
  bool vegan = false;
  bool vegetarian = false;
  bool lactoseFree = false;

}