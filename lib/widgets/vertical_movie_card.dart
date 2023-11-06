import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
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
}
