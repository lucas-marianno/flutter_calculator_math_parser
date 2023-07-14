import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences _sharedPreferences;

Future<void> initializeSharedPreferences() async {
  _sharedPreferences = await SharedPreferences.getInstance();
}

class Favorites {
  Favorites() {
    _favorites = _sharedPreferences.getStringList('favorites') ?? _defaultFavs;
  }

  bool contains(String currency) => _favorites.contains(currency);

  List<String> getFavoritesList() {
    _favorites.sort();
    return _favorites;
  }

  void clearAll() => _sharedPreferences.remove('favorites');

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
    _sharedPreferences.setStringList('favorites', _favorites);
  }

  late List<String> _favorites;
  static const List<String> _defaultFavs = ['USD', 'BRL', 'EUR', 'NZD', 'ARS', 'CLP'];
}
