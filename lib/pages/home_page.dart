import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_app/api/api_constants.dart';
import 'package:fl_app/controller/controller.dart';
import 'package:fl_app/widgets/circular_indicator.dart';
import 'package:fl_app/widgets/horizontal_movie_card.dart';
import 'package:fl_app/widgets/text1.dart';
import 'package:fl_app/widgets/vertical_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.light_mode,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        title: SizedBox(
            width: 190, child: Image.asset("assets/images/cinemaven.png")),
      ),
      body: GetBuilder<MovieController>(builder: (controller) {
        return ListView(
          children: [
            movieController.upcomingMovies.isNotEmpty
                ? CarouselSlider.builder(
                    itemCount: 10,
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1,
                      height: 350,
                      viewportFraction: 0.63,
                      enlargeCenterPage: true,
                    ),
                    itemBuilder: (context, index, realIdx) {
                      return HorizontalMovieCard(
                        onTap: () {
                          setState(() {
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
                          });
                        },
                        imgUrl: ApiConstants.baseImgUrl +
                            movieController.upcomingMovies[index].posterPath
                                .toString(),
                        movieTitle: movieController
                            .upcomingMovies[index].originalTitle
                            .toString(),
                        rating: movieController.upcomingMovies[index].voteCount
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
                            setState(() {
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
                            });
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
                            setState(() {
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
                            });
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
                            setState(() {
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
                            });
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
