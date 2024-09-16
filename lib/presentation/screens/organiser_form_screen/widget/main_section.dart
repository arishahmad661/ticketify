import 'package:flutter/material.dart';

import 'build_page_view.dart';
import 'build_smooth_page_indicator.dart';

Widget buildMainSection(List<Widget> pages, BuildContext context, PageController ctrl) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildSmoothPageIndicator(ctrl: ctrl, length: pages.length),
          const SizedBox(height: 8,),
          const Divider(),
          const SizedBox(height: 8),
          SizedBox(
            height: MediaQuery.of(context).size.height - 164,
            child: buildPageView(pages: pages, ctrl: ctrl),
          ),
        ]
    ),
  );
}
