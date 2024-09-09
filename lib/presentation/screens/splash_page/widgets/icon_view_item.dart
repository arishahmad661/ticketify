import 'package:flutter/material.dart';

Widget IconViewItem(icon1, summ1) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(icon1),
          ),
        ),
        SizedBox(width: 20,),
        Text(summ1, style: TextStyle(fontSize: 16),)
      ],
    ),
  );
}
