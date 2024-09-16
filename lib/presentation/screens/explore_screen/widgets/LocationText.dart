import 'package:flutter/material.dart';
import '../../../widgets/text.dart';

Widget LocationText() {
  return Row(
    children: [
      RichText(
        text: TextSpan(
            text: "Find events near ",style: textStyle(color: Colors.black),
            children: [
              TextSpan(
                  text: "Lucknow", style: textStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)
              ),
            ]
        ),
      ),
      const Icon(Icons.edit, color: Colors.blueAccent,)
    ],
  );
}
