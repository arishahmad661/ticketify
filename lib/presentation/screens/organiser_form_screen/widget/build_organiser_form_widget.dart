import 'package:flutter/material.dart';
import '../../../widgets/text.dart';

Widget buildOrganiserFormWidget({required organisers, required VoidCallback callback}) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Who will be the organisers ?", style: textStyle(fontSize: 32.0, fontWeight: FontWeight.bold),),
        const SizedBox(height: 8,),
        Text("Write the name of all the organisers, and give a little description about the organiser. We'll connect you with people in your area, and more can join you online. Your details must meet the community guidelines.",
          style: textStyle(),
        ),
        const SizedBox(height: 16),

        for (int i = 0; i < organisers.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              organisers.length != 1 ? Text("Organiser ${i+1}", style: textStyle(color: Colors.blue),) : SizedBox(),
              SizedBox(height: 8,),
              TextFormField(
                controller: organisers[i]['organiserName'],
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: "Organiser Name",
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: organisers[i]['organiserDescription'],
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: "Organiser Description",
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: organisers[i]['organiserEmail'],
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: "Organiser Email",
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: organisers[i]['organiserMobileNumber'],
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: "Organiser Mobile Number",
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: organisers[i]['organiserLocation'],
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: "Organiser Location",
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: organisers[i]['organiserMainLogo'],
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  hintText: "Organiser Main Logo",
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),

        const SizedBox(height: 16,),
        InkWell(
          onTap: callback,
          child: Row(
            children: [
              Icon(Icons.add_circle_outline_outlined, color: Colors.blue,),
              Text("  Add more organisers", style: textStyle(color: Colors.blue),),
            ],
          ),
        ),

        const SizedBox(height: 16,),


      ],
    ),
  );
}
