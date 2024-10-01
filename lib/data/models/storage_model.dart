import 'package:firebase_auth/firebase_auth.dart';

class StorageModel {
  StorageModel({
    required this.displayName,
    required this.userId,
    required this.email,
    required this.phoneNumber,
    required this.photoUrl,
    required this.idToken,
    required this.accessToken
  });

  final String? displayName;
  final String? userId;
  final String? email;
  final String? phoneNumber;
  final String? photoUrl;
  final String? idToken;
  final String? accessToken;

  StorageModel copyWith({
    String? displayName,
    String? userId,
    String? email,
    String? phoneNumber,
    String? photoUrl,
    String? idToken,
    String? accessToken,
  }) {
    return StorageModel(
      displayName: displayName ?? this.displayName,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      idToken: idToken ?? this.idToken,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  factory StorageModel.fromJson(UserCredential userCredential, String? accessToken, String? idToken){
    return StorageModel(
      displayName: userCredential.user!.displayName.toString(),
      userId: userCredential.user!.uid.toString(),
      email: userCredential.user!.email.toString(),
      phoneNumber: userCredential.user!.phoneNumber.toString(),
      photoUrl: userCredential.user!.photoURL.toString(),
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  Map<String, dynamic> toJson() => {
    "displayName": displayName,
    "userID": userId,
    "email": email,
    "phoneNumber": phoneNumber,
    "photoURL": photoUrl,
    "idToken": idToken,
    "accessToken": accessToken,
  };

  Map<String, dynamic> toJsonWithoutTokens() => {
    "displayName": displayName,
    "userID": userId,
    "email": email,
    "phoneNumber": phoneNumber,
    "photoURL": photoUrl,
  };

  @override
  String toString(){
    return "$displayName, $userId, $email, $phoneNumber, $photoUrl, $accessToken, $idToken";
  }
}
