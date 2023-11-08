import 'package:fl_app/api/api_client.dart';
import 'package:fl_app/models/cast_model.dart';
import 'package:fl_app/models/movie_detail_model.dart';
import 'package:fl_app/models/movie_model.dart';
import 'package:fl_app/models/movie_trailer.dart';
import 'package:fl_app/models/shaared.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MovieController extends GetxController {
  ApiClient apiClient = ApiClient();
  Rx<ThemeMode> themeMode = Rx<ThemeMode>(ThemeMode.light);
  var currentIndex = 0.obs;
  final RxList<String> favorites = <String>[].obs;

  List<MovieModel> trendingMovies = <MovieModel>[].obs;
  List<MovieModel> tamilMovies = <MovieModel>[].obs;
  List<MovieModel> topratedMovies = <MovieModel>[].obs;
  List<MovieModel> popularMovies = <MovieModel>[].obs;
  List<MovieModel> upcomingMovies = <MovieModel>[].obs;
  List<MovieModel> similarMovies = <MovieModel>[].obs;
  List<MovieModel> searchedMovies = <MovieModel>[].obs;
  List<CastModel> movieCast = <CastModel>[].obs;
  List<MovieTrailer> movieVideo = <MovieTrailer>[].obs;

  var movies = MovieDetailModel(
    adult: null,
    backdropPath: null,
    genreIds: null,
    id: null,
    originalLanguage: null,
    originalTitle: null,
    overview: null,
    popularity: null,
    posterPath: null,
    releaseDate: null,
    title: null,
    video: null,
    voteAverage: null,
    voteCount: null,
  ).obs;




  @override
  void onInit() {
    getTamil();
    getUpcoming();
    getToprated();
    getTrending();
    getPopular();

    super.onInit();
  }

  final FavoriteMovieStorage storage = FavoriteMovieStorage(); // Create an instance of FavoriteMovieStorage

  void addToFavorites(String movieId) {
    if (!favorites.contains(movieId)) {
      favorites.add(movieId);
      storage.addFavoriteMovie(movies.value); // Save the movie as a favorite
    }
  }

  void removeFromFavorites(String movieId) {
    if (favorites.contains(movieId)) {
      favorites.remove(movieId);
      storage.removeFavoriteMovie(movies.value); // Remove the movie from favorites
    }
  }

  bool isFavorite(String movieId) {
    return favorites.contains(movieId);
  }

  changeTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    return themeMode.value;
  }

  void getTamil() async {
    var movies = await apiClient.getTamilMovies();
    if (movies.isNotEmpty) {
      tamilMovies = movies;
    }
    update();
  }

  void getTrending() async {
    var movies = await apiClient.getTrendingMovies();
    if (movies.isNotEmpty) {
      trendingMovies = movies;
    }
    update();
  }

  void getToprated() async {
    var movies = await apiClient.getTopratedMovies();
    if (movies.isNotEmpty) {
      topratedMovies = movies;
    }
    update();
  }

  void getPopular() async {
    var movies = await apiClient.getPopularMovies();
    if (movies.isNotEmpty) {
      popularMovies = movies;
    }
    update();
  }

  void getUpcoming() async {
    var movies = await apiClient.getUpcomingMovies();
    if (movies.isNotEmpty) {
      upcomingMovies = movies;
    }
    update();
  }

  void getSimilar(String id) async {
    var movies = await apiClient.getSimilarMovies(id);
    if (movies.isNotEmpty) {
      similarMovies = movies;
    }
    update();
  }

  void getCastList(String id) async {
    var cast = await apiClient.getMovieCast(id);
    if (cast.isNotEmpty) {
      movieCast = cast;
    }
    update();
  }

  void getVideoList(String id) async {
    var video = await apiClient.getMovieVideo(id);
    if (video.isNotEmpty) {
      movieVideo = video;
    }
    update();
  }

  void getMovieSearch(String movieTitle) async {
    var search = await apiClient.getSearchedMovies(movieTitle);
    if (search.isNotEmpty) {
      searchedMovies = search;
    }
    update();
  }

  void getDetail(String id) async {
    var movie = await apiClient.getMovieDetails(id);
    movies(movie);
    update();
  }

  void onTap(int index) {
    currentIndex.value = index;
  }
}
