import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/models/lessons/lessons.dart';
import 'package:learning_anglish_app/data/models/units/units_model.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';

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

  Lessons? lessonsModel ;
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

  TextEditingController codeController = TextEditingController();
  void postLessonCode({lessonId}) async {
    print('******* ${lessonId}********');
    print('*******${codeController.text}********');
    Map<String,dynamic> body = {
      "code": codeController.text,
      "lessonId": lessonId,
    };
    setBusy();
    try {
      Response<dynamic> res = await api.lessonCode(body:body);
      General.showToast(message: res.data['errorMessage'] );
   //   getUserProfile();
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
