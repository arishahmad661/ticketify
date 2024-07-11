import 'package:flutter/material.dart';
import '../../../common/widgets/text.dart';

Widget dateAndTime(String formattedFromDateTime, String formattedToDateTime) {
  return Row(
    children: [
      const Icon(Icons.date_range),
      Flexible(child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text("$formattedFromDateTime - $formattedToDateTime", style: textStyle(fontSize: 16.0),),
      )),
    ],
  );
}
