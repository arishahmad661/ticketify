class AttendeesModel {
  AttendeesModel({
    required this.userEmail,
    required this.userId,
    required this.userName,
    required this.isCheckedIn,
    required this.profession,
  });

  final String userEmail;
  final String userId;
  final String userName;
  final bool isCheckedIn;
  final String profession;

  AttendeesModel copyWith({
    String? userEmail,
    String? userId,
    String? userName,
    bool? isCheckedIn,
    String? profession,
  }) {
    return AttendeesModel(
      userEmail: userEmail ?? this.userEmail,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      isCheckedIn: isCheckedIn ?? this.isCheckedIn,
      profession: profession ?? this.profession
    );
  }

  factory AttendeesModel.fromJson(Map<String, dynamic> json){
    return AttendeesModel(
      userEmail: json["userEmail"],
      userId: json["userID"],
      userName: json["userName"],
      isCheckedIn: json["isCheckedIn"],
      profession: json["profession"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userEmail": userEmail,
    "userID": userId,
    "userName": userName,
    "isCheckedIn": isCheckedIn,
    "userInterests": profession,
  };

  @override
  String toString(){
    return "$userEmail, $userId, $userName, $isCheckedIn, $profession, ";
  }
}
