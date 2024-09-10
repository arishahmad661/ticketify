import 'package:flutter/material.dart';
import '../../../widgets/text.dart';

Widget DateTimeOfEvent(String formattedFromDate, String formattedFromTime, String formattedToTime) {
  return ListTile(
    visualDensity: const VisualDensity(
        horizontal: -4, vertical: -4),
    contentPadding: const EdgeInsets.all(0),
    title: Text("$formattedFromDate"),
    subtitle: Text(
        "$formattedFromTime - $formattedToTime IST"),
    trailing: Image.asset("assets/right-arrow.png"),
    leading: const Icon(Icons.calendar_today),
    subtitleTextStyle:
    textStyle(color: Colors.black54),
  );
}
