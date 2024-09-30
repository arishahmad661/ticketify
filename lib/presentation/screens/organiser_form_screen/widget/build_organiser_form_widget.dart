import 'package:flutter/material.dart';
import '../../../widgets/build_numeric_field.dart';
import '../../../widgets/build_text_field.dart';
import '../../../widgets/text.dart';

Widget buildOrganiserFormWidget({required organiser}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Who will be the organisers ?", style: textStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
        const SizedBox(height: 8,),
        Text("Write the name of all the organisers, and give a little description about the organiser. We'll connect you with people in your area, and more can join you online. Your details must meet the community guidelines.\nGive public link from google drive.\nUse image with 1600x840 px.",
          style: textStyle(),
        ),
        const SizedBox(height: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              buildTextField(controller: organiser['organiserName'], hintText:"Organiser Name"),
              const SizedBox(height: 16),
              buildTextField(controller: organiser['organiserDescription'], hintText:"Description"),
              const SizedBox(height: 16),
              buildTextField(controller: organiser['organiserEmail'], hintText:"Organiser Email"),
              const SizedBox(height: 16),
              buildNumericField(controller: organiser['organiserMobileNumber'], hintText:"Organiser Mobile Number"),
              const SizedBox(height: 16),
              buildTextField(controller: organiser['organiserLocation'], hintText:"Organiser Location"),
              const SizedBox(height: 16),
              buildTextField(controller: organiser['organiserMainLogo'], hintText:"Organiser Main Logo"),
              const SizedBox(height: 32),
            ],
          ),
        const SizedBox(height: 16,),
      ],
    ),
  );
}


