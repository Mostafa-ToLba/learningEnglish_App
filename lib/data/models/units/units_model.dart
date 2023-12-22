// To parse this JSON data, do
//
//     final unitModel = unitModelFromJson(jsonString);

import 'dart:convert';

UnitModel unitModelFromJson(String str) => UnitModel.fromJson(json.decode(str));

String unitModelToJson(UnitModel data) => json.encode(data.toJson());

class UnitModel {
    final int? errorCode;
    final dynamic errorMessage;
    final List<UnitDetails> data;

    UnitModel({
        this.errorCode,
        this.errorMessage,
        this.data =const[],
    });

    factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
        errorCode: json["errorCode"],
        errorMessage: json["errorMessage"],
        data: json["data"] == null ? [] : List<UnitDetails>.from(json["data"]!.map((x) => UnitDetails.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "errorMessage": errorMessage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class UnitDetails {
    final int? id;
    final String? name;
    final int? educationalLevelId;
    final String? educationalLevelName;

    UnitDetails({
        this.id,
        this.name,
        this.educationalLevelId,
        this.educationalLevelName,
    });

    factory UnitDetails.fromJson(Map<String, dynamic> json) => UnitDetails(
        id: json["id"],
        name: json["name"],
        educationalLevelId: json["educationalLevelId"],
        educationalLevelName: json["educationalLevelName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "educationalLevelId": educationalLevelId,
        "educationalLevelName": educationalLevelName,
    };
}
