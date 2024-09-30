import 'package:flutter/material.dart';

Widget buildTextField({required controller, required hintText, keyboardType = TextInputType.text }) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      hintText: hintText,
    ),
  );
}
