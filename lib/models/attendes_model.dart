import 'package:cloud_firestore/cloud_firestore.dart';

class AttendeesModel {
  AttendeesModel({
    required this.userEmail,
    required this.userId,
    required this.userName,
    required this.isCheckedIn,
    required this.userPhoneNumber,
  });

  final String userEmail;
  final String userId;
  final String userName;
  final bool isCheckedIn;
  final String userPhoneNumber;

  AttendeesModel copyWith({
    String? userEmail,
    String? userId,
    String? userName,
    bool? isCheckedIn,
    String? userPhoneNumber,
  }) {
    return AttendeesModel(
      userEmail: userEmail ?? this.userEmail,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      isCheckedIn: isCheckedIn ?? this.isCheckedIn,
        userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber
    );
  }

  factory AttendeesModel.fromJson(DocumentSnapshot doc){
    final json = doc.data() as Map<String, dynamic>;
    return AttendeesModel(
      userEmail: json["userEmail"],
      userId: json["userID"],
      userName: json["userName"],
      isCheckedIn: json["isCheckedIn"],
      userPhoneNumber: json["userPhoneNumber"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userEmail": userEmail,
    "userID": userId,
    "userName": userName,
    "isCheckedIn": isCheckedIn,
    "userPhoneNumber": userPhoneNumber,
  };

  @override
  String toString(){
    return "$userEmail, $userId, $userName, $isCheckedIn, $userPhoneNumber, ";
  }
}
