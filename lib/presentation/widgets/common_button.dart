import 'package:flutter/material.dart';

Widget CommonTextButton({required function, required String buttonText}) {
  return TextButton(
    onPressed: (){
      function();
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,251,88,80)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      minimumSize: MaterialStateProperty.all(const Size(160, 50)),

    ),
    child: Text(buttonText, style: TextStyle(color: Colors.white, fontSize: 16),),
  );
}
