import 'package:flutter/material.dart';

import '../../../widgets/text.dart';

Widget EventType(isOffline, location) {
  return ListTile(
    visualDensity: const VisualDensity(
        horizontal: -4, vertical: -4),
    contentPadding: const EdgeInsets.all(0),
    title: isOffline
        ? Text(
      location,
      style: textStyle(fontSize: 16.0),
    )
        : Text(
      "Online event",
      style: textStyle(fontSize: 16.0),
    ),
    subtitle: isOffline
        ? const Text("Visit the venue")
        : Text(
      "Link visible for attendees",
      style: textStyle(fontSize: 16.0),
    ),
    trailing: Image.asset("assets/right-arrow.png"),
    leading: isOffline
        ? const Icon(Icons.location_on)
        : const Icon(Icons.videocam),
    subtitleTextStyle: textStyle(color: Colors.black54),
  );
}
