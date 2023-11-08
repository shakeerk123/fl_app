import 'package:fl_app/controller/controller.dart';
import 'package:fl_app/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class VerticalMovieCard extends StatelessWidget {
  final String imgUrl;
  final Function() onTap;
  final double width;

  VerticalMovieCard({
    Key? key,
    required this.imgUrl,
    required this.onTap,
    this.width = 180,
  }) : super(key: key);
var movieControoler =Get.put( MovieController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:movieControoler.apiClient.getPopularMovies() ,
      builder: (BuildContext context, AsyncSnapshot<List<MovieModel>> snapshot) { 
        return InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          margin: const EdgeInsets.only(left: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imgUrl), // Use NetworkImage to load the image
              ),
            ),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage, // Use kTransparentImage as a placeholder
              image: imgUrl, // The image URL
              fit: BoxFit.cover, // Added fit property to ensure proper image scaling
            ),
          ),
        ),
      );
       }
      
    );
  }
}
