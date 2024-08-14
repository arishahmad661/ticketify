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
    String? id,
    String? eventId,
    int? cost,
    String? description,
    DateTime? fromTime, registrationDeadline,
    DateTime? toTime,
    bool? isOffline,
    List<String>? images,
    String? location,
    String? mainLogo,
    String? name,
    List<String>? organisersName,
    List<String>? organisersPic,
    List<String>? organiserDescription
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

  factory FeaturedEventModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;
    return FeaturedEventModel(
      eventId: json["eventID"] ?? '',
      cost: json["cost"] ?? 0,
      description: json["description"] ?? '',
      fromTime: (json['fromTime'] as Timestamp).toDate(),
      toTime: (json['toTime'] as Timestamp).toDate(),
      isOffline: json["isOffline"] ?? false,
      images: json["images"] == null ? [] : List<String>.from(json["images"].map((x) => x)),
      location: json["location"] ?? '',
      mainLogo: json["mainLogo"] ?? '',
      name: json["name"] ?? '',
      organisersName: json["organisersName"] == null ? [] : List<String>.from(json["organisersName"].map((x) => x)),
      organisersPic: json["organisersPic"] == null ? [] : List<String>.from(json["organisersPic"].map((x) => x)),
      organiserDescription: json["organiserDescription"] == null ? [] : List<String>.from(json["organiserDescription"].map((x) => x)),
      registrationDeadline: (json['registrationDeadline'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
    "eventID": eventId,
    "cost": cost,
    "description": description,
    "fromTime": fromTime,
    "toTime": toTime,
    "isOffline": isOffline,
    "images": images,
    "location": location,
    "mainLogo": mainLogo,
    "name": name,
    "organisersName": organisersName,
    "organisersPic": organisersPic,
    "organiserDescription": organiserDescription,
    "registrationDeadline": registrationDeadline,
  };
}
