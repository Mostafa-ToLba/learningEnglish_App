import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_anglish_app/data/exams/exams_model.dart';
import 'package:learning_anglish_app/data/models/answers/answers_model.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';
import '/business_logic/setup/base_notifier.dart';

class ExamsViewModel extends BaseNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;

  int selectedIndex = 0;
  List<String> questionList = [
    "had written",
    "has written",
    "had been written",
    "wrote",
  ];

  List<String> questionNums = [
    "A",
    "B",
    "C",
    "D",
  ];
  /*
  ExamModel examModel = ExamModel(
    errorCode: 0,
    errorMessage: null,
    data: Data(
      id: 13,
      name: "emt7an egbary",
      examType: 0,
      numberOfQuestions: 2,
      timeOfExam: 10,
      degree: 8,
      successDegree: 6,
      questions: [
        Question(
          id: 16,
          questionBody: "what is your age",
          answerReview: "mmmmmmmmmmmmmmm",
          degree: 4,
          isQuestionAsPicture: false,
          answers: [
            Answer(
              id: 29,
              answerNumber: 2,
              isAnswerAsPicture: false,
              answerBody: "aaaaaa",
              isCorrect: false,
            ),
            Answer(
              id: 30,
              answerNumber: 3,
              isAnswerAsPicture: false,
              answerBody: "ssssssss",
              isCorrect: true,
            ),
            Answer(
              id: 28,
              answerNumber: 1,
              isAnswerAsPicture: false,
              answerBody: "mmmmm",
              isCorrect: false,
            ),
            Answer(
              id: 31,
              answerNumber: 4,
              isAnswerAsPicture: false,
              answerBody: "rrrrrrrrrr",
              isCorrect: false,
            ),
          ],
        ),
        Question(
          id: 15,
          questionBody: "what is your name ",
          answerReview: "his name is ali",
          degree: 4,
          isQuestionAsPicture: false,
          answers: [
            Answer(
              id: 27,
              answerNumber: 4,
              isAnswerAsPicture: false,
              answerBody: "mohamed",
              isCorrect: false,
            ),
            Answer(
              id: 25,
              answerNumber: 2,
              isAnswerAsPicture: false,
              answerBody: "rana",
              isCorrect: false,
            ),
            Answer(
              id: 24,
              answerNumber: 1,
              isAnswerAsPicture: false,
              answerBody: "mostafa",
              isCorrect: false,
            ),
            Answer(
              id: 26,
              answerNumber: 3,
              isAnswerAsPicture: false,
              answerBody: "ali",
              isCorrect: true,
            ),
          ],
        ),
      ],
    ),
  );
  */
  chooseQuestion({index}) {
    selectedIndex = index;
    print(index);
    notifyListeners();
  }

  ExamModel? examModel;

  void getExams(int examId) async {
    setBusy();
    try {
      Response<dynamic> res = await api.exams(examId: examId);
      General.showToast(message: res.data['errorMessage'] ?? '');
      examModel = ExamModel.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  void saveExamResult(AnswersModel answerModel) async {
    setBusy();
    Map<String, dynamic> body = answerModel.toJson();
    try {
      Response<dynamic> res = await api.saveExamResult(body: body);
      General.showToast(message: res.data['errorMessage'] ?? '');
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
