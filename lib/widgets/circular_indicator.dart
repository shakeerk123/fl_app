import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CircleIndicator extends StatelessWidget {
  final double width, height;
  const CircleIndicator({super.key, this.width =40.0, this.height = 40.0});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
      width: 40,
      child: Center(
        child:LoadingIndicator(indicatorType: Indicator.cubeTransition,colors: [Colors.blue,Colors.white],)
      ),
    );
  }
}
