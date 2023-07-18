import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences sharedPreferences;

Future<void> initializeSharedPreferences() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

class Favorites {
  Favorites();
  bool isUpdating = false;
  List<String> _favorites = sharedPreferences.getStringList('favorites') ?? [];

  bool contains(String currency) => _favorites.contains(currency);
  Future<void> clearAll() async {
    isUpdating = true;
    await sharedPreferences.remove('favorites');
    isUpdating = false;
  }

  bool isEmpty() => !sharedPreferences.containsKey('favorites');
  List<String> getFavoritesList() {
    try {
      _favorites.sort();
    } catch (e) {
      null;
    }
    return _favorites;
  }

  Future<void> toggleFavorite(String currency) async {
    isUpdating = true;
    _favorites.contains(currency) ? await _removeFavorite(currency) : await _addFavorite(currency);
    isUpdating = false;
  }

  Future<void> _addFavorite(String currency) async {
    isUpdating = true;
    _favorites.add(currency);
    _favorites = _favorites.toSet().toList();
    await _saveToSharedPreferences();
    isUpdating = false;
  }

  Future<void> _removeFavorite(String currency) async {
    isUpdating = true;
    if (!_favorites.contains(currency)) return;
    _favorites.remove(currency);
    await _saveToSharedPreferences();
    isUpdating = false;
  }

  Future<void> _saveToSharedPreferences() async {
    isUpdating = true;
    await sharedPreferences.setStringList('favorites', _favorites);
    isUpdating = false;
  }
}
