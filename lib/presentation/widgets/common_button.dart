import 'package:flutter/material.dart';

Widget CommonTextButton({required Function function, required String buttonText, buttonColor = const Color.fromARGB(255,251,88,80)}) {
  return TextButton(
    onPressed: (){
      function();
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(buttonColor),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      minimumSize: MaterialStateProperty.all(const Size(160, 50)),

    ),
    child: Text(buttonText, style: TextStyle(color: Colors.white, fontSize: 16),),
  );
}
