import 'package:flutter/material.dart';

Widget Seperator() {
  return LayoutBuilder(builder: (context, constraints) {
    final boxWidth = constraints.constrainWidth();
    const dashWidth = 5.0;
    const dashHeight = 3.0;
    final dashCount = (boxWidth / (2 * dashWidth)).floor();
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(dashCount, (_) => const SizedBox(
        width: dashWidth,
        height: dashHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey),
        ),
      )),
    );
  },);
}
