import 'package:flutter/material.dart';

Widget buildPageView({required pages, required ctrl}) {
  return PageView.builder(
    controller: ctrl,
    itemCount: pages.length,
    itemBuilder: (_, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: pages[index],
      );
    },
  );
}
