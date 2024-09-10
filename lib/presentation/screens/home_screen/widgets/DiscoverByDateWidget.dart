import 'package:flutter/material.dart';

Widget DiscoverByDateWidget({required String text}) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text),
    ),
  );
}
