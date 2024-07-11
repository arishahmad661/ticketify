import 'package:flutter/material.dart';

Image buildNetworkImage({required imgURL}) {
  return Image.network(
    imgURL, width: 280,
    frameBuilder: (context, child, frame, wasSynchronouslyLoaded){
      if(frame == null){
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: CircularProgressIndicator(),),
        );
      }
      return child;
    },
    errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error)),
  );
}


Image buildNetworkImagePoster({required imgURL}) {
  return Image.network(
    imgURL,
    frameBuilder: (context, child, frame, wasSynchronouslyLoaded){
      if(frame == null){
        return const Center(child: CircularProgressIndicator(),);
      }
      return child;
    },
    errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
  );
}