import '../../../../storage/storage_client.dart';

Future<String?> loadUserPhoto() async {
  final imageUrl = await Storage().fetchUserPhotoURL();
  return imageUrl;
}