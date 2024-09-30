import 'package:flutter/material.dart';
import 'package:ticketify/presentation/widgets/build_text_field.dart';
import '../../../widgets/text.dart';

Widget commonEntryWidget({required heading, required description, required hintText, required ctrl}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: textStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
        const SizedBox(height: 8,),
        Text(description,
          style: textStyle(),
        ),
        SizedBox(height: 16,),
        buildTextField(controller: ctrl, hintText: hintText)
      ],
    ),
  );
}
