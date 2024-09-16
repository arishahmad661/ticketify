import 'package:flutter/material.dart';
import '../explore_screen/widgets/buildHomeAppBar.dart';
import '../home_screen/widget/buildHomeScreenAppBar.dart';

AppBar? buildMainScreenAppBar({required int index}) {
  if (index == 0) {
    return buildHomeScreenAppBar();
  } else if (index == 1) {
    return buildExploreScreenAppBar();
  }
  return null;
}