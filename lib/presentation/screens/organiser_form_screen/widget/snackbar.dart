import 'package:flutter/material.dart';
import '../../../widgets/text.dart';

SnackBar snackBar({required String text, required String buttonLabel, required int jumpToPage, required PageController ctrl}){
  return SnackBar(
    content: Text(
      text,
      style: textStyle(color: Colors.white),
    ),
    action: SnackBarAction(
        label: buttonLabel,
        textColor: Colors.white,
        backgroundColor: Colors.blueGrey,
        onPressed: (){
          ctrl.animateToPage(
            jumpToPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
    ),
  );
}
