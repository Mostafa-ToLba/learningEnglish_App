import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_anglish_app/data/models/examResultDetails/exam_result_details_model.dart';
import 'package:learning_anglish_app/data/models/exams/exams_model.dart';
import 'package:learning_anglish_app/data/models/answers/answers_model.dart';
import 'package:learning_anglish_app/data/models/results/results_model.dart';
import 'package:learning_anglish_app/data/models/studentExams/student_exams_model.dart';
import 'package:learning_anglish_app/presentation/screens/exams/exams_solved_screen.dart';
import 'package:learning_anglish_app/presentation/screens/result/results_screen.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
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
  chooseQuestion({index}) {
    selectedIndex = index;
    print(index);
    notifyListeners();
  }

  ExamModel? examModel;
  ResultsModel? resultsModel;
  StudentExamsModel? studentExamsModel;
  int? examResultId;
  ExamResultDetailsModel? examResultDetailsModel;

  void getExams(int examId) async {
    setBusy();
    try {
      Response<dynamic> res = await api.exams(examId: examId);
      res.data['errorMessage'] != null
          ? General.showToast(message: res.data['errorMessage'])
          : null;
      examModel = ExamModel.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  void saveExamResult(BuildContext context, AnswersModel answerModel) async {
    setBusy();
    Map<String, dynamic> body = answerModel.toJson();
    print("examsResult");
    Logger().d(body);
    try {
      Response<dynamic> res = await api.saveExamResult(body: body);
      res.data['errorMessage'] != null
          ? General.showToast(message: res.data['errorMessage'])
          : null;
      if (res.data["errorCode"] == 0) {
        resultsModel = ResultsModel.fromJson(res.data);
        Navigator.pushReplacement(context, SlideTransition1(ResultsScreen()));
      }
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  void getStudentExams(BuildContext context) async {
    setBusy();
    try {
      Response<dynamic> res = await api.getStudentExams();
      res.data['errorMessage'] != null
          ? General.showToast(message: res.data['errorMessage'])
          : null;
      //General.showToast(message: res.data['errorMessage'] ?? 'Data done');
      studentExamsModel = StudentExamsModel.fromJson(res.data);
      if (studentExamsModel?.data != []) {
        studentExamsModel!.data!.any((map) {
          map.examId == examModel!.data!.id! ? examResultId = map.examId : null;
          if (examResultId != null) {
            return true;
          }

          return false;
        });
        Navigator.push(context, SlideTransition1(ExamsSolvedScreen()));
      }
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  void getStudentExamResultDetails() async {
    setBusy();
    try {
      Response<dynamic> res =
          await api.getStudentExamResultDetails(examResultId!);
      General.showToast(message: res.data['errorMessage'] ?? '');
      examResultDetailsModel = ExamResultDetailsModel.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
