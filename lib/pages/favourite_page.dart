import 'package:fl_app/api/api_constants.dart';
import 'package:fl_app/controller/controller.dart';
import 'package:fl_app/widgets/circular_indicator.dart';
import 'package:fl_app/widgets/fav_card.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';
 

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: movieController.trendingMovies.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return FavCard(
                      imgUrl: ApiConstants.baseImgUrl +
                          movieController.trendingMovies[index].posterPath
                              .toString(),
                      title: movieController
                          .trendingMovies[index].originalTitle
                          .toString(),
                      overview: movieController
                          .trendingMovies[index].overview
                          .toString(),
                      rating: movieController
                          .trendingMovies[index].voteAverage!
                          .toStringAsFixed(1),
                      runtime: '125',
                      releaseDate: movieController
                          .trendingMovies[index].releaseDate
                          .toString(),
                    );
                  }),
            )
          : const CircleIndicator(),
    );
  }
}
