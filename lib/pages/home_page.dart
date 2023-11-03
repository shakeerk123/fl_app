// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_app/api/api_constants.dart';
import 'package:fl_app/controller/controller.dart';
import 'package:fl_app/widgets/circular_indicator.dart';
import 'package:fl_app/widgets/header_tile.dart';
import 'package:fl_app/widgets/horizontal_movie_card.dart';
import 'package:fl_app/widgets/text1.dart';
import 'package:fl_app/widgets/vertical_movie_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MovieController>(builder: (controller) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            HeaderTile(),
            movieController.upcomingMovies.isNotEmpty
                ? CarouselSlider.builder(
                    itemCount: 10,
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1,
                      height: 200,
                      viewportFraction: 0.93,
                      enlargeCenterPage: true,
                    ),
                    itemBuilder: (context, index, id) {
                      return HorizontalMovieCard(
                        onTap: () {
                          movieController.getCastList(movieController
                              .upcomingMovies[index].id
                              .toString());
                          movieController.getDetail(movieController
                              .upcomingMovies[index].id
                              .toString());
                          movieController.getSimilar(movieController
                              .upcomingMovies[index].id
                              .toString());
                          Get.toNamed('/deatils');
                        },
                        imgUrl: ApiConstants.baseImgUrl +
                            movieController.upcomingMovies[index].backdropPath
                                .toString(),
                        movieTitle: movieController
                            .upcomingMovies[index].originalTitle
                            .toString(),
                      );
                    },
                  )
                : const CircleIndicator(height: 201, width: double.maxFinite),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 8, top: 20),
              child: Text1(text: 'Trending Now'),
            ),
            SizedBox(
              height: 270,
              child: movieController.trendingMovies.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movieController.trendingMovies.length,
                      itemBuilder: (context, index) {
                        return VerticalMovieCard(
                          onTap: () {
                            movieController.getCastList(movieController
                                .trendingMovies[index].id
                                .toString());
                            movieController.getDetail(movieController
                                .trendingMovies[index].id
                                .toString());
                            movieController.getSimilar(movieController
                                .trendingMovies[index].id
                                .toString());
                            Get.toNamed('/deatils');
                          },
                          imgUrl: ApiConstants.baseImgUrl +
                              movieController.trendingMovies[index].posterPath
                                  .toString(),
                        );
                      })
                  : const CircleIndicator(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 8, top: 20),
              child: Text1(text: 'Top Rated Movies'),
            ),
            SizedBox(
              height: 270,
              child: movieController.topratedMovies.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movieController.topratedMovies.length,
                      itemBuilder: (context, index) {
                        return VerticalMovieCard(
                          onTap: () {
                            movieController.getCastList(movieController
                                .topratedMovies[index].id
                                .toString());
                            movieController.getDetail(movieController
                                .topratedMovies[index].id
                                .toString());
                            movieController.getSimilar(movieController
                                .topratedMovies[index].id
                                .toString());
                            Get.toNamed('/deatils');
                          },
                          imgUrl: ApiConstants.baseImgUrl +
                              movieController.topratedMovies[index].posterPath
                                  .toString(),
                        );
                      })
                  : const CircleIndicator(),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 8, top: 20),
              child: Text1(text: 'Popular Movies'),
            ),
            SizedBox(
              height: 270,
              child: movieController.popularMovies.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movieController.popularMovies.length,
                      itemBuilder: (context, index) {
                        return VerticalMovieCard(
                          onTap: () {
                            movieController.getCastList(movieController
                                .popularMovies[index].id
                                .toString());
                            movieController.getDetail(movieController
                                .popularMovies[index].id
                                .toString());
                            movieController.getSimilar(movieController
                                .popularMovies[index].id
                                .toString());
                            Get.toNamed('/deatils');
                          },
                          imgUrl: ApiConstants.baseImgUrl +
                              movieController.popularMovies[index].posterPath
                                  .toString(),
                        );
                      })
                  : const CircleIndicator(),
            ),
          ],
        );
      }),
    );
  }
}
