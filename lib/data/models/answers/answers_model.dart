// To parse this JSON data, do
//
//     final AnswersModel = AnswersModelFromJson(jsonString);

import 'dart:convert';

AnswersModel answersModelFromJson(String str) =>
    AnswersModel.fromJson(json.decode(str));

String answersModelToJson(AnswersModel data) => json.encode(data.toJson());

class AnswersModel {
  final int? examId;
  final List<Result>? result;

  AnswersModel({
    this.examId,
    this.result,
  });

  factory AnswersModel.fromJson(Map<String, dynamic> json) => AnswersModel(
        examId: json["examId"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "examId": examId,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  final int? questionId;
  final int? answerId;

  Result({
    this.questionId,
    this.answerId,
  });
  Result changeAnswerId(int answerId) => Result(
        questionId: questionId,
        answerId: answerId,
      );
  factory Result.fromJson(Map<String, dynamic> json) => Result(
        questionId: json["questionId"],
        answerId: json["answerId"],
      );

  Map<String, dynamic> toJson() => {
        "questionId": questionId,
        "answerId": answerId,
      };
}
