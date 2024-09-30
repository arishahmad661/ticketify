import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildNumericField({required controller, required hintText}) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.number,
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'\d')),
    ],
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      hintText: hintText,
    ),
  );
}
