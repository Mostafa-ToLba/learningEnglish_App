
// To parse this JSON data, do
//
//     final educationLevels = educationLevelsFromJson(jsonString);

import 'dart:convert';

EducationLevels educationLevelsFromJson(String str) => EducationLevels.fromJson(json.decode(str));

String educationLevelsToJson(EducationLevels data) => json.encode(data.toJson());

class EducationLevels {
  final int? errorCode;
  final String? errorMessage;
  final List<Level> data;

  EducationLevels({
    this.errorCode,
    this.errorMessage,
    this.data = const [],
  });

  factory EducationLevels.fromJson(Map<String, dynamic> json) => EducationLevels(
    errorCode: json["errorCode"],
    errorMessage: json["errorMessage"],
    data: List<Level>.from(json["data"]!.map((x) => Level.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "errorCode": errorCode,
    "errorMessage": errorMessage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Level {
  final int? id;
  final String? name;

  Level({
    this.id,
    this.name,
  });

  factory Level.fromJson(Map<String, dynamic> json) => Level(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

