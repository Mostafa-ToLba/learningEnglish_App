
// To parse this JSON data, do
//
//     final lessons = lessonsFromJson(jsonString);

import 'dart:convert';

Lessons lessonsFromJson(String str) => Lessons.fromJson(json.decode(str));

String lessonsToJson(Lessons data) => json.encode(data.toJson());

class Lessons {
  final int? errorCode;
  final dynamic errorMessage;
  final List<Lesson> data;

  Lessons({
    this.errorCode,
    this.errorMessage,
    this.data = const [],
  });

  factory Lessons.fromJson(Map<String, dynamic> json) => Lessons(
    errorCode: json["errorCode"],
    errorMessage: json["errorMessage"],
    data: json["data"] == null ? [] : List<Lesson>.from(json["data"]!.map((x) => Lesson.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "errorCode": errorCode,
    "errorMessage": errorMessage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Lesson {
  final int? id;
  final String? name;
  final String? description;
  final bool? isHaveExam;
  final bool? isCompulsoryExam;
  final dynamic pdfUrl;
  final String? videoUrl;
  final int? unitId;
  final String? unitName;
  final bool? studentOwnIt;
  final List<Exame>? exames;

  Lesson({
    this.id,
    this.name,
    this.description,
    this.isHaveExam,
    this.isCompulsoryExam,
    this.pdfUrl,
    this.videoUrl,
    this.unitId,
    this.unitName,
    this.studentOwnIt,
    this.exames,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    isHaveExam: json["isHaveExam"],
    isCompulsoryExam: json["isCompulsoryExam"],
    pdfUrl: json["pdfUrl"],
    videoUrl: json["videoUrl"],
    unitId: json["unitId"],
    unitName: json["unitName"],
    studentOwnIt: json["studentOwnIt"],
    exames: json["exames"] == null ? [] : List<Exame>.from(json["exames"]!.map((x) => Exame.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "isHaveExam": isHaveExam,
    "isCompulsoryExam": isCompulsoryExam,
    "pdfUrl": pdfUrl,
    "videoUrl": videoUrl,
    "unitId": unitId,
    "unitName": unitName,
    "studentOwnIt": studentOwnIt,
    "exames": exames == null ? [] : List<dynamic>.from(exames!.map((x) => x.toJson())),
  };
}

class Exame {
  final int? examType;
  final int? id;

  Exame({
    this.examType,
    this.id,
  });

  factory Exame.fromJson(Map<String, dynamic> json) => Exame(
    examType: json["examType"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "examType": examType,
    "id": id,
  };
}
