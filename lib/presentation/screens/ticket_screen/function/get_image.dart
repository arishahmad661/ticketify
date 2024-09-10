import '../../../widgets/build_network_image.dart';

Future getImages(String imageURL, double width) async {
  return buildNetworkImage(imgURL: imageURL, width: width);
}