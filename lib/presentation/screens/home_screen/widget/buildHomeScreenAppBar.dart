import 'package:flutter/material.dart';

AppBar buildHomeScreenAppBar() {
  return AppBar(
    title: Image.asset("assets/appbar-logo.png", fit: BoxFit.contain,),
    centerTitle: true,
    toolbarHeight: 60,
  );
}