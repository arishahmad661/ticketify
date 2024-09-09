import 'package:flutter/material.dart';
import 'home_page_button_style.dart';

Widget homePageButton(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      homePageButtonStyle(buttonText: "Schedule Demo", buttonColor:const Color.fromARGB(255,87,33,72), context: context),
      homePageButtonStyle(buttonText: "Host an Event", buttonColor:const Color.fromARGB(255,251,88,80), context: context),
    ],
  );
}


