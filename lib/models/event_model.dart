import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  EventModel({
    required this.registrationDeadline,
    required this.cost,
    required this.id,
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

  final int cost;
  final String id;
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

  EventModel copyWith({
    int? cost,
    String? id,
    String? description,
    DateTime? fromTime,
    DateTime? toTime,
    bool? isOffline,
    List<String>? images,
    String? location,
    String? mainLogo,
    String? name,
    List<String>? organisersName,
    List<String>? organisersPic,
  }) {
    return EventModel(
      cost: cost ?? this.cost,
      id: id ?? this.id,
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

  factory EventModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;
    return EventModel(
      id: doc.id,
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
    "cost": cost,
    "id": id,
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
