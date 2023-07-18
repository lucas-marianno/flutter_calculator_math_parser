import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences sharedPreferences;

Future<void> initializeSharedPreferences() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

class Favorites {
  Favorites() {
    _favorites = sharedPreferences.getStringList('favorites') ?? [];
  }
  late List<String> _favorites;

  bool contains(String currency) => _favorites.contains(currency);
  void clearAll() => sharedPreferences.remove('favorites');
  bool isEmpty() => !sharedPreferences.containsKey('favorites');

  List<String> getFavoritesList() {
    try {
      _favorites.sort();
    } catch (e) {
      null;
    }
    return _favorites;
  }

  void toggleFavorite(String currency) {
    _favorites.contains(currency) ? _removeFavorite(currency) : _addFavorite(currency);
  }

  void _addFavorite(String currency) {
    _favorites.add(currency);
    _favorites = _favorites.toSet().toList();
    _saveToSharedPreferences();
  }

  void _removeFavorite(String currency) {
    if (!_favorites.contains(currency)) return;
    _favorites.remove(currency);
    _saveToSharedPreferences();
  }

  void _saveToSharedPreferences() {
    sharedPreferences.setStringList('favorites', _favorites);
  }
}
