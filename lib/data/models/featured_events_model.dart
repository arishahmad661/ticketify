import 'package:cloud_firestore/cloud_firestore.dart';

class FeaturedEventModel {
  final String eventId;
  final int cost;
  final String description;
  final DateTime fromTime;
  final DateTime toTime, registrationDeadline;
  final bool isOffline;
  final String location;
  final String mainLogo;
  final String name;
  final String organisersName;
  final String organisersMainLogo, organiserDescription, organiserEmail, organiserMobileNumber, organiserLocation;

  FeaturedEventModel({
    required this.registrationDeadline,
    required this.eventId,
    required this.cost,
    required this.description,
    required this.fromTime,
    required this.toTime,
    required this.isOffline,
    required this.location,
    required this.mainLogo,
    required this.name,
    required this.organisersName,
    required this.organisersMainLogo,
    required this.organiserDescription,
    required this.organiserEmail,
    required this.organiserMobileNumber,
    required this.organiserLocation,
  });

  FeaturedEventModel copyWith({
    String? eventId,
    int? cost,
    String? description,
    DateTime? fromTime,
    DateTime? toTime,
    DateTime? registrationDeadline,
    bool? isOffline,
    String? images,
    String? location,
    String? mainLogo,
    String? name,
    String? organisersName,
    String? organiserDescription,
    String? organisersMainLogo,
    String? organiserEmail,
    String? organiserMobileNumber,
    String? organiserLocation,

  }) {
    return FeaturedEventModel(
      eventId: eventId ?? this.eventId,
      cost: cost ?? this.cost,
      description: description ?? this.description,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      isOffline: isOffline ?? this.isOffline,
      location: location ?? this.location,
      mainLogo: mainLogo ?? this.mainLogo,
      name: name ?? this.name,
      organisersName: organisersName ?? this.organisersName,
      organisersMainLogo: organisersMainLogo ?? this.organisersMainLogo,
      organiserDescription: organiserDescription ?? this.organiserDescription,
      registrationDeadline: registrationDeadline ?? this.registrationDeadline,
      organiserEmail: organiserEmail ?? this.organiserEmail,
      organiserMobileNumber: organiserMobileNumber ?? this.organiserMobileNumber,
      organiserLocation: organiserLocation ?? this.organiserLocation,
    );
  }

  factory FeaturedEventModel.fromJson(Map<String, dynamic> json) {
    return FeaturedEventModel(
      eventId: json["eventId"] ?? '',
      cost: json["cost"] ?? 0,
      description: json["description"] ?? '',
      fromTime: _parseDate(json['fromTime']),
      toTime: _parseDate(json['toTime']),
      isOffline: json["isOffline"] ?? false,
      location: json["location"] ?? '',
      mainLogo: json["mainLogo"] ?? '',
      name: json["name"] ?? '',
      organisersName: json["organisersName"],
      organisersMainLogo: json["organisersMainLogo"],
      organiserDescription: json["organiserDescription"],
      registrationDeadline: json['registrationDeadline'] != null
          ? (json['registrationDeadline'] is Timestamp
          ? (json['registrationDeadline'] as Timestamp).toDate()
          : DateTime.parse(json['registrationDeadline']))
          : DateTime.now(),
      organiserEmail: json['organiserEmail'],
      organiserMobileNumber: json['organiserMobileNumber'],
      organiserLocation: json['organiserLocation'], // Default to current date if missing
    );
  }

  Map<String, dynamic> toJson() => {
    "eventId": eventId,
    "cost": cost,
    "description": description,
    "fromTime": fromTime.toIso8601String(),
    "toTime": toTime.toIso8601String(),
    "isOffline": isOffline,
    "location": location,
    "mainLogo": mainLogo,
    "name": name,
    "organisersName": organisersName,
    "organisersMainLogo": organisersMainLogo,
    "organiserDescription": organiserDescription,
    "registrationDeadline": Timestamp.fromDate(registrationDeadline),
    "organiserEmail":organiserEmail,
    "organiserMobileNumber":organiserMobileNumber,
    "organiserLocation":organiserLocation,
  };

  static DateTime _parseDate(dynamic date) {
    if (date is Timestamp) {
      return date.toDate();
    } else if (date is String) {
      return DateTime.parse(date);
    } else {
      throw Exception('Unsupported date format');
    }
  }
}
