import 'package:fl_app/widgets/container_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_app/api/api_constants.dart';
import 'package:fl_app/controller/controller.dart';
import 'package:fl_app/widgets/circular_indicator.dart';
import 'package:fl_app/widgets/text1.dart';
import 'package:loading_indicator/loading_indicator.dart';


class ContainerWidget extends StatelessWidget {
  final String title;
  final List<dynamic> movies;
  final MovieController movieController;

  ContainerWidget({
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
        SizedBox(width: MediaQuery.of(context).size.width,
          height: 180,
          child: movies.isNotEmpty
              ? ListView.builder(physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ContainerCard(
                      onTap: () {
                         movieController.getCastList(movies
                                  [4].id
                                  .toString());
                              movieController.getDetail(movies
                                 [4].id
                                  .toString());
                              movieController.getSimilar(movies
                                [4].id
                                  .toString());
                              Get.toNamed('/deatils');
                      },
                      imgUrl: ApiConstants.baseImgUrl +
                          (movies[4].backdropPath ?? 'No image avilable').toString(),
                    );
                  },
                )
              :  Center(
                child: SizedBox(width: 40,height: 40,
                  child: LoadingIndicator(indicatorType:Indicator.cubeTransition),),
              ),
        ),
      ],
    );
  }
}
