// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    final int? errorCode;
    final String? errorMessage;
    final List<NotificationDetails>? data;

    NotificationModel({
        this.errorCode,
        this.errorMessage,
        this.data,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        errorCode: json["errorCode"],
        errorMessage: json["errorMessage"],
        data: json["data"] == null ? [] : List<NotificationDetails>.from(json["data"]!.map((x) => NotificationDetails.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "errorMessage": errorMessage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class NotificationDetails {
    final int? id;
    final String? title;
    final String? description;

    NotificationDetails({
        this.id,
        this.title,
        this.description,
    });

    factory NotificationDetails.fromJson(Map<String, dynamic> json) => NotificationDetails(
        id: json["id"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
    };
}
