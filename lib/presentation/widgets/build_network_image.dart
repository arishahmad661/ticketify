import 'package:flutter/material.dart';

import 'loading_indicator.dart';

Image buildNetworkImage({required String imgURL, width = 280.0}) {
  return Image.network(
    imgURL,
    width: width,
    frameBuilder: (context, child, frame, wasSynchronouslyLoaded){
      if(frame == null){
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildLoadingIndicator(),
        );
      }
      return child;
    },
    errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error)),
  );
}


Image buildNetworkImagePoster({required String imgURL}) {
  return Image.network(
    imgURL,
    frameBuilder: (context, child, frame, wasSynchronouslyLoaded){
      if(frame == null){
        return buildLoadingIndicator();
      }
      return child;
    },
    errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
  );
}