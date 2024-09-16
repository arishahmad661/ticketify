import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildSmoothPageIndicator({required ctrl, required length}) {
  return SmoothPageIndicator(
    controller: ctrl,
    count: length,
    effect: const ExpandingDotsEffect(activeDotColor: Colors.blueGrey,spacing: 18,dotWidth: 32),
    axisDirection: Axis.horizontal,
  );
}