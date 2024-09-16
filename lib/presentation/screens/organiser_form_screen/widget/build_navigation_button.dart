import 'package:flutter/material.dart';

Widget buildNavigationButton({required function, required icon}) {
  return InkWell(
    onTap: function,
    child: Container(
      width: 100,
      height: 50,
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: icon,
    ),
  );
}
