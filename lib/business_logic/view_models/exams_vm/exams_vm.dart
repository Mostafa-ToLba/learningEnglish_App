import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_anglish_app/data/models/examResultDetails/exam_result_details_model.dart';
import 'package:learning_anglish_app/data/models/exams/exams_model.dart';
import 'package:learning_anglish_app/data/models/answers/answers_model.dart';
import 'package:learning_anglish_app/data/models/results/results_model.dart';
import 'package:learning_anglish_app/data/models/studentExams/student_exams_model.dart';
import 'package:learning_anglish_app/presentation/screens/exams/exams_solved_screen.dart';
import 'package:learning_anglish_app/presentation/screens/exams/exams_unsolved_screen.dart';
import 'package:learning_anglish_app/presentation/screens/result/results_screen.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';
import '/business_logic/setup/base_notifier.dart';

class ExamsViewModel extends BaseNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;
  bool isShowAnswerChecked = false;
  int? selectedIndex;
  void checkAnswer() {
    selectedIndex ==null?General.showToast(message: 'اختار اجابة'):
    isShowAnswerChecked = true;
    notifyListeners();
  }

  void chooseAnswerInHomeworkAndExams(int index) {
    selectedIndex = index;
    print(index);
    notifyListeners();
  }

  ExamModel? examModel;
  ResultsModel? resultsModel;
  StudentExamsModel? studentExamsModel;
  int? examResultId;
  ExamResultDetailsModel? examResultDetailsModel;
  bool? isToken;
  void isStudentTookExam(BuildContext context, int examId) async {
    setBusy();
    try {
      Response<dynamic> res = await api.getStudentExams();
      res.data['errorMessage'] != null
          ? General.showToast(message: res.data['errorMessage'])
          : null;
      studentExamsModel = StudentExamsModel.fromJson(res.data);
      if (studentExamsModel?.data != []) {
        isToken = studentExamsModel!.data!.any((map) {
          bool result = map.examId == examId;
          result ? examResultId = map.examResultId : null;
          return result;
        });
       
      }
      if (isToken == true) {
        Navigator.push(context, SlideTransition1(ExamsSolvedScreen()));
      } else {
        Navigator.push(
            context, SlideTransition1(ExamsUnsolvedScreen(examId: examId)));
      }
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  void getExams(int examId) async {
    setBusy();
    try {
      //  if (isToken == true) {
      Response<dynamic> res = await api.exams(examId: examId);
      res.data['errorMessage'] != null
          ? General.showToast(message: res.data['errorMessage'])
          : null;
      examModel = ExamModel.fromJson(res.data);
      print("examModel");
      Logger().d(examModel?.data);
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
        Navigator.of(context).pop();
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
      print("examResultId");
      Logger().d(examResultId);
      Response<dynamic> res = await api.getStudentExams();
      res.data['errorMessage'] != null
          ? General.showToast(message: res.data['errorMessage'])
          : null;
      //General.showToast(message: res.data['errorMessage'] ?? 'Data done');
      studentExamsModel = StudentExamsModel.fromJson(res.data);
      if (studentExamsModel?.data != []) {
        print(studentExamsModel?.data);
        studentExamsModel!.data!.any((map) {
          bool result = map.examId == examModel!.data!.id!;
          result ? examResultId = map.examResultId : null;
          return result;
        });
        print(examResultId);
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
      res.data['errorMessage'] != null
          ? General.showToast(message: res.data['errorMessage'])
          : null;
      examResultDetailsModel = ExamResultDetailsModel.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
