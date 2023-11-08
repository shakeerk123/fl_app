import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_app/api/api_constants.dart';
import 'package:fl_app/controller/controller.dart';
import 'package:fl_app/widgets/circular_indicator.dart';
import 'package:fl_app/widgets/full_width_container.dart';
import 'package:fl_app/widgets/horizontal_movie_card.dart';
import 'package:fl_app/widgets/movie_list.dart';
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
        leading: const Icon(
          Icons.light_mode,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        title: SizedBox(
            width: 190, child: Image.asset("assets/images/cinemaven.png")),
      ),
      body: GetBuilder<MovieController>(builder: (controller) {
        return ListView(physics:const BouncingScrollPhysics(),
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
                    itemBuilder: (context, index, idx) {
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
                            movieController.upcomingMovies[index].posterPath
                                .toString(),
                        movieTitle: movieController
                            .upcomingMovies[index].originalTitle
                            .toString(),
                        rating: movieController.upcomingMovies[index].voteAverage
                            .toString(),
                      );
                    },
                  )
                : const CircleIndicator(height: 201, width: double.maxFinite),
            MovieListWidget(
                title: "Trending Now",
                movies:movieController.trendingMovies,
                movieController: movieController),
            ContainerWidget(
                title: "Blockbusters",
                movies: movieController.popularMovies,
                movieController: movieController),
            MovieListWidget(
                title: "Top Rated",
                movies: movieController.topratedMovies,
                movieController: movieController),
            MovieListWidget(
                title: "Popular",
                movies: movieController.popularMovies,
                movieController: movieController),
            MovieListWidget(
                title: "Tamil hits",
                movies: movieController.tamilMovies,
                movieController: movieController),
          ],
        );
      }),
    );
  }
}
