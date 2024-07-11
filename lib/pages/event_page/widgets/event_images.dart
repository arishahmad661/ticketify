import 'package:flutter/material.dart';

import '../../../common/widgets/build_network_image.dart';

Widget eventImages({required List<String> imageURL, required BuildContext context}) {
  if (imageURL.isEmpty) {
    return const Center(
      child: Text('No images available'),
    );
  }

  return SizedBox(
    height: 180,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imageURL.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: buildNetworkImagePoster(imgURL: imageURL[index]),
          ),
        );
      },
      shrinkWrap: true, // Important to set when using GridView inside another scrollable widget
    ),
  );
}
