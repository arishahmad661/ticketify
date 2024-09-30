import 'package:flutter/material.dart';
import 'package:ticketify/presentation/widgets/build_network_image.dart';

Widget eventImages({required String imageURL, required BuildContext context}) {
  if (imageURL.isEmpty) {
    return const Center(child: Icon(Icons.error));
  }

  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: buildNetworkImagePoster(imgURL: imageURL),
  );
}
