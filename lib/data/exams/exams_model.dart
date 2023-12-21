// To parse this JSON data, do
//
//     final examModel = examModelFromJson(jsonString);

import 'dart:convert';

ExamModel examModelFromJson(String str) => ExamModel.fromJson(json.decode(str));

String examModelToJson(ExamModel data) => json.encode(data.toJson());

class ExamModel {
    final int? errorCode;
    final dynamic errorMessage;
    final Data? data;

    ExamModel({
        this.errorCode,
        this.errorMessage,
        this.data,
    });

    factory ExamModel.fromJson(Map<String, dynamic> json) => ExamModel(
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
    final int? examType;
    final int? numberOfQuestions;
    final int? timeOfExam;
    final int? degree;
    final int? successDegree;
    final List<Question>? questions;

    Data({
        this.id,
        this.name,
        this.examType,
        this.numberOfQuestions,
        this.timeOfExam,
        this.degree,
        this.successDegree,
        this.questions,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        examType: json["examType"],
        numberOfQuestions: json["numberOfQuestions"],
        timeOfExam: json["timeOfExam"],
        degree: json["degree"],
        successDegree: json["successDegree"],
        questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "examType": examType,
        "numberOfQuestions": numberOfQuestions,
        "timeOfExam": timeOfExam,
        "degree": degree,
        "successDegree": successDegree,
        "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x.toJson())),
    };
}

class Question {
    final int? id;
    final String? questionBody;
    final String? answerReview;
    final int? degree;
    final bool? isQuestionAsPicture;
    final List<Answer>? answers;

    Question({
        this.id,
        this.questionBody,
        this.answerReview,
        this.degree,
        this.isQuestionAsPicture,
        this.answers,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        questionBody: json["questionBody"],
        answerReview: json["answerReview"],
        degree: json["degree"],
        isQuestionAsPicture: json["isQuestionAsPicture"],
        answers: json["answers"] == null ? [] : List<Answer>.from(json["answers"]!.map((x) => Answer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "questionBody": questionBody,
        "answerReview": answerReview,
        "degree": degree,
        "isQuestionAsPicture": isQuestionAsPicture,
        "answers": answers == null ? [] : List<dynamic>.from(answers!.map((x) => x.toJson())),
    };
}

class Answer {
    final int? id;
    final int? answerNumber;
    final bool? isAnswerAsPicture;
    final String? answerBody;
    final bool? isCorrect;

    Answer({
        this.id,
        this.answerNumber,
        this.isAnswerAsPicture,
        this.answerBody,
        this.isCorrect,
    });

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        answerNumber: json["answerNumber"],
        isAnswerAsPicture: json["isAnswerAsPicture"],
        answerBody: json["answerBody"],
        isCorrect: json["isCorrect"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "answerNumber": answerNumber,
        "isAnswerAsPicture": isAnswerAsPicture,
        "answerBody": answerBody,
        "isCorrect": isCorrect,
    };
}
