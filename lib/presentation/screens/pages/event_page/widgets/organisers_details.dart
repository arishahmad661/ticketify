import 'package:flutter/material.dart';
import 'package:ticketify/presentation/widgets/build_network_image.dart';
import 'package:ticketify/presentation/widgets/text.dart';

Widget organisersDetail({required featuredEvent}) {
  return Column(
    children: List.generate(featuredEvent.organisersName.length, (index) {
      return Column(
        children: [
          buildNetworkImage(imgURL: featuredEvent.organisersPic[index]),
          Text(
            featuredEvent.organisersName[index],
            textAlign: TextAlign.center,
            style: textStyle(fontSize: 32.0, color: const Color.fromARGB(255, 87, 33, 72), fontWeight: FontWeight.bold),
          ),
          Text(
            featuredEvent.organiserDescription[index],
            style: textStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 8),
        ],
      );
    }),
  );
}