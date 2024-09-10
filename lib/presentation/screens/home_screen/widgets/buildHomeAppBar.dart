import 'package:flutter/material.dart';

AppBar buildHomeAppBar() {
  return AppBar(
      toolbarHeight: 100,
      title: SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            elevation: MaterialStateProperty.all(0.0),
            side: MaterialStateProperty.all(const BorderSide(color: Colors.grey, )),
            shape:MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
            onTap: (){},
            onChanged: (_){},
            leading: const Icon(Icons.search, color: Colors.black54,),
            hintText: "Explore upcoming events",
            hintStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black54)),
            controller: controller,
          );
        },
        suggestionsBuilder: (BuildContext context, SearchController controller) { return List.generate(3, (index) => Text(index.toString())); },

      )
  );
}
