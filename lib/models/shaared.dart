import 'package:shared_preferences/shared_preferences.dart';
import 'package:fl_app/models/movie_detail_model.dart';

class FavoriteMovieStorage {
  static const _keyFavoriteMovies = 'favorite_movies';

  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  List<MovieDetailModel> getFavoriteMovies() {
    final favoriteMoviesJson = _preferences.getStringList(_keyFavoriteMovies);
    if (favoriteMoviesJson == null) {
      return [];
    }

    return favoriteMoviesJson
        .map((movieJson) => MovieDetailModel.fromJson(movieJson as Map<String, dynamic>))
        .toList();
  }

  void addFavoriteMovie(MovieDetailModel movie) {
    final favoriteMovies = getFavoriteMovies();
    favoriteMovies.add(movie);

    final favoriteMoviesJson =
        favoriteMovies.map((movie) => movie.toJson()).toList();
    _preferences.setStringList(_keyFavoriteMovies, favoriteMoviesJson.cast<String>());
  }

  void removeFavoriteMovie(MovieDetailModel movie) {
    final favoriteMovies = getFavoriteMovies();
    favoriteMovies.removeWhere((m) => m.id == movie.id);

    final favoriteMoviesJson =
        favoriteMovies.map((movie) => movie.toJson()).toList();
    _preferences.setStringList(_keyFavoriteMovies, favoriteMoviesJson.cast<String>());
  }
}
