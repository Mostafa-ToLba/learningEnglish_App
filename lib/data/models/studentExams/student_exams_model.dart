// To parse this JSON data, do
//
//     final studentExamsModel = studentExamsModelFromJson(jsonString);

import 'dart:convert';

StudentExamsModel studentExamsModelFromJson(String str) => StudentExamsModel.fromJson(json.decode(str));

String studentExamsModelToJson(StudentExamsModel data) => json.encode(data.toJson());

class StudentExamsModel {
    final int? errorCode;
    final dynamic errorMessage;
    final List<Datum>? data;

    StudentExamsModel({
        this.errorCode,
        this.errorMessage,
        this.data,
    });

    factory StudentExamsModel.fromJson(Map<String, dynamic> json) => StudentExamsModel(
        errorCode: json["errorCode"],
        errorMessage: json["errorMessage"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "errorMessage": errorMessage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final int? examResultId;
    final int? examId;
    final ExamName? examName;
    final int? degree;
    final int? successDegree;
    final bool? isPassed;
    final int? score;
    final int? examType;
    final int? lessonId;

    Datum({
        this.examResultId,
        this.examId,
        this.examName,
        this.degree,
        this.successDegree,
        this.isPassed,
        this.score,
        this.examType,
        this.lessonId,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        examResultId: json["examResultId"],
        examId: json["examId"],
        examName: examNameValues.map[json["examName"]]!,
        degree: json["degree"],
        successDegree: json["successDegree"],
        isPassed: json["isPassed"],
        score: json["score"],
        examType: json["examType"],
        lessonId: json["lessonId"],
    );

    Map<String, dynamic> toJson() => {
        "examResultId": examResultId,
        "examId": examId,
        "examName": examNameValues.reverse[examName],
        "degree": degree,
        "successDegree": successDegree,
        "isPassed": isPassed,
        "score": score,
        "examType": examType,
        "lessonId": lessonId,
    };
}

enum ExamName {
    EMT7_AN_EGBARY
}

final examNameValues = EnumValues({
    "emt7an egbary": ExamName.EMT7_AN_EGBARY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
