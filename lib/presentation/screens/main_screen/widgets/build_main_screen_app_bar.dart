import 'package:flutter/material.dart';
import '../../explore_screen/widgets/buildHomeAppBar.dart';
import '../../home_screen/widgets/buildHomeScreenAppBar.dart';

AppBar? buildMainScreenAppBar({required int index, imageURL}){
  if (index == 0) {
    return buildHomeScreenAppBar(imageURL: imageURL);
  } else if (index == 1) {
    return buildExploreScreenAppBar();
  }
  return null;
}