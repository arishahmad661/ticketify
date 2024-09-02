import 'package:cloud_firestore/cloud_firestore.dart';

class FeaturedEventModel {
  final String eventId;
  final int cost;
  final String description;
  final DateTime fromTime;
  final DateTime toTime, registrationDeadline;
  final bool isOffline;
  final List<String> images;
  final String location;
  final String mainLogo;
  final String name;
  final List<String> organisersName;
  final List<String> organisersPic, organiserDescription;

  FeaturedEventModel({
    required this.registrationDeadline,
    required this.eventId,
    required this.cost,
    required this.description,
    required this.fromTime,
    required this.toTime,
    required this.isOffline,
    required this.images,
    required this.location,
    required this.mainLogo,
    required this.name,
    required this.organisersName,
    required this.organisersPic,
    required this.organiserDescription,
  });

  FeaturedEventModel copyWith({
    String? eventId,
    int? cost,
    String? description,
    DateTime? fromTime,
    DateTime? toTime,
    DateTime? registrationDeadline,
    bool? isOffline,
    List<String>? images,
    String? location,
    String? mainLogo,
    String? name,
    List<String>? organisersName,
    List<String>? organisersPic,
    List<String>? organiserDescription,
  }) {
    return FeaturedEventModel(
      eventId: eventId ?? this.eventId,
      cost: cost ?? this.cost,
      description: description ?? this.description,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      isOffline: isOffline ?? this.isOffline,
      images: images ?? this.images,
      location: location ?? this.location,
      mainLogo: mainLogo ?? this.mainLogo,
      name: name ?? this.name,
      organisersName: organisersName ?? this.organisersName,
      organisersPic: organisersPic ?? this.organisersPic,
      organiserDescription: organiserDescription ?? this.organiserDescription,
      registrationDeadline: registrationDeadline ?? this.registrationDeadline,
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
      images: json["images"] == null ? [] : List<String>.from(json["images"].map((x) => x)),
      location: json["location"] ?? '',
      mainLogo: json["mainLogo"] ?? '',
      name: json["name"] ?? '',
      organisersName: json["organisersName"] == null ? [] : List<String>.from(json["organisersName"].map((x) => x)),
      organisersPic: json["organisersPic"] == null ? [] : List<String>.from(json["organisersPic"].map((x) => x)),
      organiserDescription: json["organiserDescription"] == null ? [] : List<String>.from(json["organiserDescription"].map((x) => x)),
      registrationDeadline: json['registrationDeadline'] != null
          ? (json['registrationDeadline'] is Timestamp
          ? (json['registrationDeadline'] as Timestamp).toDate()
          : DateTime.parse(json['registrationDeadline']))
          : DateTime.now(), // Default to current date if missing
    );
  }

  Map<String, dynamic> toJson() => {
    "eventId": eventId,
    "cost": cost,
    "description": description,
    "fromTime": fromTime.toIso8601String(),
    "toTime": toTime.toIso8601String(),
    "isOffline": isOffline,
    "images": images,
    "location": location,
    "mainLogo": mainLogo,
    "name": name,
    "organisersName": organisersName,
    "organisersPic": organisersPic,
    "organiserDescription": organiserDescription,
    "registrationDeadline": Timestamp.fromDate(registrationDeadline),
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
