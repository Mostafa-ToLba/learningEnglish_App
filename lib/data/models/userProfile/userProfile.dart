
// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  final int? errorCode;
  final dynamic errorMessage;
  final Data? data;

  UserProfile({
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    errorCode: json["errorCode"],
    errorMessage: json["errorMessage"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "errorCode": errorCode,
    "errorMessage": errorMessage,
    "data": data?.toJson(),
  };
}

class Data {
  final String? email;
  final String? fullName;
  final List<String>? role;
  final int? userType;
  final bool? status;
  final dynamic userImgUrl;

  Data({
    this.email,
    this.fullName,
    this.role,
    this.userType,
    this.status,
    this.userImgUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json["email"],
    fullName: json["fullName"],
    role: json["role"] == null ? [] : List<String>.from(json["role"]!.map((x) => x)),
    userType: json["userType"],
    status: json["status"],
    userImgUrl: json["userImgUrl"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "fullName": fullName,
    "role": role == null ? [] : List<dynamic>.from(role!.map((x) => x)),
    "userType": userType,
    "status": status,
    "userImgUrl": userImgUrl,
  };
}
