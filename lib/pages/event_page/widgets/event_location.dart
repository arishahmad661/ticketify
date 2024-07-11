import 'package:flutter/material.dart';
import '../../../common/widgets/text.dart';

Widget eventLocation({required location}) {
  return Row(
    children: [
      const Icon(Icons.location_on, size: 24),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(location, style: textStyle( fontSize: 16.0),),
      )
    ],
  );
}
