import 'package:flutter/material.dart';

AppBar buildHomeScreenAppBar({required imageURL}){
  return AppBar(
    title: Image.asset("assets/appbar-logo.png"),
    centerTitle: true,
    toolbarHeight: 60,
    leading: Icon(Icons.menu),
    actions:[
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: CircleAvatar(
        radius: 20,backgroundColor: Colors.transparent,

          backgroundImage: NetworkImage(imageURL),
        ),
      ),
    ]
  );
}