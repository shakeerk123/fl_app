import 'package:fl_app/models/shaared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  final FavoriteMovieStorage storage = FavoriteMovieStorage();

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = storage.getFavoriteMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies'),
      ),
      body: Obx(
        () => favoriteMovies.isEmpty
            ? Center(
                child: Text('You have no favorite movies yet.'),
              )
            : ListView.builder(
                itemCount: favoriteMovies.length,
                itemBuilder: (context, index) {
                  final movie = favoriteMovies[index];
                  return ListTile(
                    title: Text(movie.originalTitle.toString()),
                    // Add more movie details as needed
                  );
                },
              ),
      ),
    );
  }
}
