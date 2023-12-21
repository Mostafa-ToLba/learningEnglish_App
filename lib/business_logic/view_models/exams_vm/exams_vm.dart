import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_anglish_app/data/exams/exams_model.dart';
import 'package:learning_anglish_app/data/models/answers/answers_model.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';
import '/business_logic/setup/base_notifier.dart';

class ExamsViewModel extends BaseNotifier
{
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

  chooseQuestion({index})
  {
    selectedIndex = index ;
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