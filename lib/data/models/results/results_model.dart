// To parse this JSON data, do
//
//     final resultsModel = resultsModelFromJson(jsonString);

import 'dart:convert';

ResultsModel resultsModelFromJson(String str) => ResultsModel.fromJson(json.decode(str));

String resultsModelToJson(ResultsModel data) => json.encode(data.toJson());

class ResultsModel {
    final int? errorCode;
    final String? errorMessage;
    final Data? data;

    ResultsModel({
        this.errorCode,
        this.errorMessage,
        this.data,
    });

    factory ResultsModel.fromJson(Map<String, dynamic> json) => ResultsModel(
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
    final int? id;
    final String? name;
    final int? degree;
    final int? successDegree;
    final int? score;
    final bool? isPassed;
    final List<WrongQuestion>? wrongQuestions;

    Data({
        this.id,
        this.name,
        this.degree,
        this.successDegree,
        this.score,
        this.isPassed,
        this.wrongQuestions,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        degree: json["degree"],
        successDegree: json["successDegree"],
        score: json["score"],
        isPassed: json["isPassed"],
        wrongQuestions: json["wrongQuestions"] == null ? [] : List<WrongQuestion>.from(json["wrongQuestions"]!.map((x) => WrongQuestion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "degree": degree,
        "successDegree": successDegree,
        "score": score,
        "isPassed": isPassed,
        "wrongQuestions": wrongQuestions == null ? [] : List<dynamic>.from(wrongQuestions!.map((x) => x.toJson())),
    };
}

class WrongQuestion {
    final int? id;
    final String? questionBody;
    final String? answerReview;

    WrongQuestion({
        this.id,
        this.questionBody,
        this.answerReview,
    });

    factory WrongQuestion.fromJson(Map<String, dynamic> json) => WrongQuestion(
        id: json["id"],
        questionBody: json["questionBody"],
        answerReview: json["answerReview"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "questionBody": questionBody,
        "answerReview": answerReview,
    };
}
