// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_app/api/api_constants.dart';
import 'package:fl_app/controller/controller.dart';
import 'package:fl_app/widgets/circular_indicator.dart';
import 'package:fl_app/widgets/horizontal_movie_card.dart';
import 'package:fl_app/widgets/text1.dart';
import 'package:fl_app/widgets/vertical_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  MovieController movieController = Get.put(MovieController());

  void navigateToMovieDetails(int index) {
    movieController.getCastList(movieController.upcomingMovies[index].id.toString());
    movieController.getDetail(movieController.upcomingMovies[index].id.toString());
    movieController.getSimilar(movieController.upcomingMovies[index].id.toString());
    Get.toNamed('/details');
  }

  Widget buildCarouselSlider() {
    return CarouselSlider.builder(
      itemCount: movieController.upcomingMovies.length,
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 1,
        height: 350,
        viewportFraction: 0.63,
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, id) {
        return HorizontalMovieCard(
          onTap: () {
            navigateToMovieDetails(index);
          },
          imgUrl: ApiConstants.baseImgUrl +
              movieController.upcomingMovies[index].posterPath.toString(),
          movieTitle: movieController.upcomingMovies[index].originalTitle.toString(),
          rating: movieController.upcomingMovies[index].voteAverage.toString(),
        );
      },
    );
  }

  Widget buildMovieCategory(String title, List<dynamic> movies) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.0, bottom: 8, top: 20),
          child: Text1(text: title),
        ),
        SizedBox(
          height: 270,
          child: movies.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return VerticalMovieCard(
                      onTap: () {
                        navigateToMovieDetails(index);
                      },
                      imgUrl: ApiConstants.baseImgUrl + movies[index].posterPath.toString(),
                    );
                  },
                )
              : CircleIndicator(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.light_mode, color: Colors.white),
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: SizedBox(
          width: 190,
          child: Image.asset("assets/images/cinemaven.png"),
        ),
      ),
      body: GetBuilder<MovieController>(builder: (controller) {
        return ListView(
          physics: BouncingScrollPhysics(),
          children: [
            movieController.upcomingMovies.isNotEmpty ? buildCarouselSlider() : CircleIndicator(height: 201, width: double.maxFinite),
            buildMovieCategory('Trending Now', movieController.trendingMovies),
            buildMovieCategory('Top Rated Movies', movieController.topratedMovies),
            buildMovieCategory('Popular Movies', movieController.popularMovies),
          ],
        );
      }),
    );
  }
}
