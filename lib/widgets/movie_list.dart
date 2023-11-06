import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_app/api/api_constants.dart';
import 'package:fl_app/controller/controller.dart';
import 'package:fl_app/widgets/circular_indicator.dart';
import 'package:fl_app/widgets/text1.dart';
import 'package:fl_app/widgets/vertical_movie_card.dart';

class MovieListWidget extends StatelessWidget {
  final String title;
  final List<dynamic> movies;
  final MovieController movieController;

  MovieListWidget({
    required this.title,
    required this.movies,
    required this.movieController,
  });



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 8, top: 20),
          child: Text1(text: title),
        ),
        SizedBox(
          height: 220,
          child: movies.isNotEmpty
              ? ListView.builder(physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return VerticalMovieCard(
                      onTap: () {
                         movieController.getCastList(movies
                                  [index].id
                                  .toString());
                              movieController.getDetail(movies
                                 [index].id
                                  .toString());
                              movieController.getSimilar(movies
                                [index].id
                                  .toString());
                              Get.toNamed('/deatils');
                      },
                      imgUrl: ApiConstants.baseImgUrl +
                          (movies[index].posterPath ?? 'No image avilable').toString(),
                    );
                  },
                )
              : const CircleIndicator(),
        ),
      ],
    );
  }
}
