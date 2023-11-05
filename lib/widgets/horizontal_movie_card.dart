import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class HorizontalMovieCard extends StatelessWidget {
  final String imgUrl,rating, movieTitle;
  final Function() onTap;

  const HorizontalMovieCard({
    Key? key,
    required this.imgUrl,
    required this.movieTitle,
    required this.onTap, required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(top: 20,right: 20,
              
              child: Text('⭐  $rating')),
           
          ],
        ),
      ),
    );
  }
}
