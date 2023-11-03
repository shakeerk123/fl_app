import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HorizontalMovieCard extends StatelessWidget {
  final String imgUrl, movieTitle;
  final Function() onTap;

  const HorizontalMovieCard({
    Key? key,
    required this.imgUrl,
    required this.movieTitle,
    required this.onTap,
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
            // Add a ClipRRect widget here to create rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imgUrl, // Use the imgUrl passed as a parameter
                fit: BoxFit.cover, // You can change the fit as needed
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              child: SizedBox(
                width: 200,
                child: Text(
                  movieTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
