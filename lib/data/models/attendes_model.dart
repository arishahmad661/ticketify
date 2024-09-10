class AttendeesModel {
  AttendeesModel({
    required this.userEmail,
    required this.userId,
    required this.userName,
    required this.isCheckedIn,
    required this.userPhoneNumber,
    this.orderId,
    this.paymentId,
    required this.id
  });

  final String userEmail;
  final String userId;
  final String userName;
  final bool isCheckedIn;
  final String userPhoneNumber;
  final String? orderId;
  final String? paymentId;
  final String? id;

  AttendeesModel copyWith({
    String? userEmail,
    String? userId,
    String? userName,
    bool? isCheckedIn,
    String? userPhoneNumber,
    String? orderId,
    String? paymentId,
    String? id
  }) {
    return AttendeesModel(
        userEmail: userEmail ?? this.userEmail,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
        isCheckedIn: isCheckedIn ?? this.isCheckedIn,
        userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
        orderId: orderId ?? this.orderId,
        paymentId: paymentId ?? this.paymentId,
        id: id ?? this.id
    );
  }

  factory AttendeesModel.fromJson(Map<String, dynamic> json){
    return AttendeesModel(
      userEmail: json["userEmail"],
      userId: json["userID"],
      userName: json["userName"],
      isCheckedIn: json["isCheckedIn"],
      userPhoneNumber: json["userPhoneNumber"],
      orderId: json["orderId"],
      paymentId: json["paymentId"],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
    "userEmail": userEmail,
    "userID": userId,
    "userName": userName,
    "isCheckedIn": isCheckedIn,
    "userPhoneNumber": userPhoneNumber,
    "orderId": orderId,
    "paymentId": paymentId,
    "id": id,
  };

  @override
  String toString(){
    return "$userEmail, $userId, $userName, $isCheckedIn, $userPhoneNumber, $orderId, $paymentId, $id";
  }
}
