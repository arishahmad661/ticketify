import 'package:flutter/material.dart';

import '../../../common/widgets/text.dart';

Widget onlineMedium() {
  return Row(
    children: [
      const Icon(Icons.online_prediction, size: 32),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text("Online", style: textStyle(fontSize: 24.0),),
      )
    ],
  );
}
