import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Shimmer.fromColors(highlightColor: Colors.grey,
          baseColor: Colors.white,
          child: Image.asset("assets/images/cinemaven.png")),
        ),
      ),
    );
  }
}