import 'package:flutter/material.dart';

Widget buildListTile({tileTitle, tileSubtitle, tileTrailing, tileLeading}){
  return ListTile(
    title: tileTitle,
    subtitle: tileSubtitle,
    trailing: tileTrailing,
    leading: tileLeading,
  );
}