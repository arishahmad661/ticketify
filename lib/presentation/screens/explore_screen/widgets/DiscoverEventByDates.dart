import 'package:flutter/cupertino.dart';
import 'DiscoverByDateWidget.dart';

Widget DiscoverEventByDates() {
  return Wrap(
    runSpacing: 8.0,
    children: [
      DiscoverByDateWidget( text: "Today",),
      const SizedBox(width: 8,),
      DiscoverByDateWidget( text: "Tomorrow"),
      const SizedBox(width: 8,),
      DiscoverByDateWidget( text: "This weekend",),
      const SizedBox(width: 8,),
      DiscoverByDateWidget( text: "Choose date",),
      const SizedBox(width: 8,),
      DiscoverByDateWidget( text: "All upcoming",),
    ],
  );
}
