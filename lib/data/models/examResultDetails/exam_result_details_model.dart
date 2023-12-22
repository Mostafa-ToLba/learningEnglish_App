// To parse this JSON data, do
//
//     final examResultDetailsModel = examResultDetailsModelFromJson(jsonString);

import 'dart:convert';

ExamResultDetailsModel examResultDetailsModelFromJson(String str) => ExamResultDetailsModel.fromJson(json.decode(str));

String examResultDetailsModelToJson(ExamResultDetailsModel data) => json.encode(data.toJson());

class ExamResultDetailsModel {
    final int? errorCode;
    final dynamic errorMessage;
    final List<Datum>? data;

    ExamResultDetailsModel({
        this.errorCode,
        this.errorMessage,
        this.data,
    });

    factory ExamResultDetailsModel.fromJson(Map<String, dynamic> json) => ExamResultDetailsModel(
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
    final String? examName;
    final int? degree;
    final int? successDegree;
    final bool? isPassed;
    final int? score;
    final int? examType;
    final int? questionCount;
    final int? timeOfExam;
    final List<Question>? questions;

    Datum({
        this.examResultId,
        this.examId,
        this.examName,
        this.degree,
        this.successDegree,
        this.isPassed,
        this.score,
        this.examType,
        this.questionCount,
        this.timeOfExam,
        this.questions,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        examResultId: json["examResultId"],
        examId: json["examId"],
        examName: json["examName"],
        degree: json["degree"],
        successDegree: json["successDegree"],
        isPassed: json["isPassed"],
        score: json["score"],
        examType: json["examType"],
        questionCount: json["questionCount"],
        timeOfExam: json["timeOfExam"],
        questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "examResultId": examResultId,
        "examId": examId,
        "examName": examName,
        "degree": degree,
        "successDegree": successDegree,
        "isPassed": isPassed,
        "score": score,
        "examType": examType,
        "questionCount": questionCount,
        "timeOfExam": timeOfExam,
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
    final bool? studentAnswer;

    Answer({
        this.id,
        this.answerNumber,
        this.isAnswerAsPicture,
        this.answerBody,
        this.isCorrect,
        this.studentAnswer,
    });

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        answerNumber: json["answerNumber"],
        isAnswerAsPicture: json["isAnswerAsPicture"],
        answerBody: json["answerBody"],
        isCorrect: json["isCorrect"],
        studentAnswer: json["studentAnswer"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "answerNumber": answerNumber,
        "isAnswerAsPicture": isAnswerAsPicture,
        "answerBody": answerBody,
        "isCorrect": isCorrect,
        "studentAnswer": studentAnswer,
    };
}
