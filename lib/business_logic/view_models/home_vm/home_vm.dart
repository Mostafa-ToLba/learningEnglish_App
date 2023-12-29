import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/models/lessons/lessons.dart';
import 'package:learning_anglish_app/data/models/units/units_model.dart';
import 'package:learning_anglish_app/presentation/widgets/customDialog/customDialog.dart';
import 'package:learning_anglish_app/presentation/widgets/update/animatedUpdate.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';

enum ExamType { exam, homework, questionbank }

final examTypeForToast = {
  ExamType.exam: "exams",
  ExamType.homework: "homework",
  ExamType.questionbank: "questions"
};

class HomeViewModel extends BaseNotifier {
  //*******************  units  *************************//
  UnitModel? unitModel;
  void getUnits({levelId}) async {
    setBusy();
    try {
      Response<dynamic> res = await api.units(levelId: levelId);
      unitModel = UnitModel.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  //*******************  Lessons  *************************//

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.cyan,
    // Added 10 colors
  ];

  Lessons? lessonsModel;
  void getLessons({unitId}) async {
    setBusy();
    try {
      Response<dynamic> res = await api.lessons(unitId: unitId);
      lessonsModel = Lessons.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  //*******************  post lesson code  *************************//
  bool validCode = false;
  TextEditingController codeController = TextEditingController();
  void postLessonCode({lessonId, context, unitId}) async {
    Map<String, dynamic> body = {
      "code": codeController.text,
      "lessonId": lessonId,
    };
    setBusy();
    try {
      Response<dynamic> res = await api.lessonCode(body: body);
      General.showToast(message: res.data['errorMessage'] ?? 'تم الشراء بنجاح');
      if (res.data['errorCode'] == 0) {
        validCode = true;
        Navigator.pop(context);
        getLessons(unitId: unitId);
        ShowCustomDialog(
                context: context,
                content: AnimatedUpdate(updatedMassage: 'تم شراء الحصة بنجاح'))
            .showCustomDialg(context);
      }
      //   getUserProfile();
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  //*******************  check if there is exams in lesson  *************************//
  List<Exam>? examList;
  //*********************************************************************************************??
  void checkExamsByLessonn(int lessonId) {
    examList = [];
    examList?.clear();
    if (lessonsModel?.data != null) {
      lessonsModel!.data!.any((lesson) {
        if (lesson.id == lessonId) {
     //     print(lesson.exams![0].examType);
     //     print(lesson.exams![0].id);
          examList = lesson.exams;
          print(examList!.length);
          notifyListeners();
          return true;
        }
        return false;
      });
    } else {
      General.showToast(message: "No exams for this lesson yet");
    }
  }
  void checkExamsByLesson(int lessonId) {
    examList = [];
    examList?.clear();
    if (lessonsModel?.data != null) {
      for (var lesson in lessonsModel!.data!) {
        if (lesson.id == lessonId) {
          //     print(lesson.exams![0].examType);
          //     print(lesson.exams![0].id);
          examList = lesson.exams;
          print(examList!.length);
          notifyListeners();
          continue;
        }
        continue;
      }
    } else {
      examList = [];
      General.showToast(message: "No exams for this lesson yet");
    }
  }
  //*********************************************************************************************??
  //*******************  check if there is exams by examtype  *************************//
  int? examId;
  void checkExamsByExamTypee(BuildContext context, ExamType examtype) {
    examId = null;
    if (examList != List.empty()) {
      examList!.any((exam) {
        print(exam);
        if (exam.examType == examtype.index) {
          examId = exam.id;
          return true;
        }
        else
        {
          examId = null;
        }

        return false;
      });
      print('************** ${examId}*********examIddddddd**');
    } else {
      examList= [] ;
      notifyListeners();
      General.showToast(
          message:
              "No ${examTypeForToast.values.elementAt(examtype.index)} for this lesson yet");
    }
  }
  void checkExamsByExamType(BuildContext context, ExamType examtype) {
    if (examList != List.empty()) {
      for (var exam in examList!) {
        print(exam);
        if (exam.examType == examtype.index) {
          examId = exam.id;
          notifyListeners();
          continue;
        }
        else
        {
          examId = null;
        }

        continue;
      }
      print('************** ${examId}***********');
    } else {
      General.showToast(
          message:
          "No ${examTypeForToast.values.elementAt(examtype.index)} for this lesson yet");
    }
  }
  //***********************************************************************************//

  void addDeviceToken() async {
    Map<String, dynamic> body = {
      "deviceToken": AppConstants.deviceToken.toString(),
    };
    setBusy();
    try {
      Response<dynamic> res = await api.addDeviceToken(body: body);
      General.showToast(message: res.data['errorMessage']);
      if (res.data['errorCode'] == 0) {

      }
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
