import 'package:flutter/material.dart';
import 'package:ticketify/presentation/screens/organiser_form_screen/widget/build_navigation_button.dart';

Widget buildNavigation({required ctrl, required length}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNavigationButton(function: (){
            if (ctrl.page > 0) {
              ctrl.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }, icon: const Icon(Icons.arrow_back_ios, color: Colors.white,) ),
          buildNavigationButton(function: (){
            if (ctrl.page != length - 1) {
              ctrl.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }, icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,)),
        ],
      ),
    ),
  );
}
