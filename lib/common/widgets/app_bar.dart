import 'package:flutter/material.dart';
import 'package:ticketify/common/widgets/text.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255,253,177,75),
    title: Text(
      "Ticketify",
      style: textStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 87, 33, 72)),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 87, 33, 72),
            size: 32,
          )
      )
    ],
  );
}
