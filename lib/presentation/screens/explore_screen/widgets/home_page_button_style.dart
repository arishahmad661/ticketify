import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget homePageButtonStyle({buttonText, buttonColor, context}) {
  return TextButton(
    onPressed: (){
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HostEventEntryPage(),));
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(buttonColor),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      minimumSize: MaterialStateProperty.all(const Size(160, 50)),

    ),
    child: Row(
      children: [
        Text(buttonText, style: const TextStyle(color: Colors.white, fontSize: 16),),
        const SizedBox(width: 5,),
        const Icon(Icons.arrow_circle_right_sharp, color: Colors.white,)
      ],
    ),
  );
}