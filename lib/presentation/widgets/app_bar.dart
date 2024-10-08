import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ticketify/presentation/widgets/text.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255,253,177,75),
    title: Text(
      "Ticketify",
      style: textStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 87, 33, 72)),
    ),
    actions: [
      IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 87, 33, 72),
            size: 32,
          )
      )
    ],
  );
}
