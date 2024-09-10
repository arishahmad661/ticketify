import 'package:flutter/material.dart';
import 'icon_view_item.dart';

Widget IconView({summ1, summ2, summ3, icon1, icon2, icon3}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconViewItem(icon1, summ1),
      IconViewItem(icon2, summ2),
      IconViewItem(icon3, summ3),
    ],
  );
}

