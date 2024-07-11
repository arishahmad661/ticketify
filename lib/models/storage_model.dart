import 'package:firebase_auth/firebase_auth.dart';

class StorageModel {
  StorageModel({
    required this.displayName,
    required this.userId,
    required this.email,
    required this.phoneNumber,
    required this.photoUrl,
  });

  final String? displayName;
  final String? userId;
  final String? email;
  final String? phoneNumber;
  final String? photoUrl;

  StorageModel copyWith({
    String? displayName,
    String? userId,
    String? email,
    String? phoneNumber,
    String? photoUrl,
  }) {
    return StorageModel(
      displayName: displayName ?? this.displayName,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  factory StorageModel.fromJson(UserCredential userCredential){
    Map<String, dynamic> json = userCredential as Map<String, dynamic>;
    return StorageModel(
      displayName: json["displayName"],
      userId: json["userID"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      photoUrl: json["photoURL"],
    );
  }

  Map<String, dynamic> toJson() => {
    "displayName": displayName,
    "userID": userId,
    "email": email,
    "phoneNumber": phoneNumber,
    "photoURL": photoUrl,
  };

  @override
  String toString(){
    return "$displayName, $userId, $email, $phoneNumber, $photoUrl, ";
  }
}
