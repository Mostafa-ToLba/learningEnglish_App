import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/models/lessons/lessons.dart';
import 'package:learning_anglish_app/data/models/units/units_model.dart';
import 'package:learning_anglish_app/presentation/widgets/customDialog/customDialog.dart';
import 'package:learning_anglish_app/presentation/widgets/update/animatedUpdate.dart';
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
  bool validCode =false;
  TextEditingController codeController = TextEditingController();
  void postLessonCode({lessonId,context,unitId}) async {
    Map<String,dynamic> body = {
      "code": codeController.text,
      "lessonId": lessonId,
    };
    setBusy();
    try {
      Response<dynamic> res = await api.lessonCode(body:body);
      General.showToast(message: res.data['errorMessage']??'تم الشراء بنجاح');
      if(res.data['errorCode']==0) {
        validCode = true;
        Navigator.pop(context);
        ShowCustomDialog(
            context: context, content:AnimatedUpdate(
            updatedMassage: 'تم شراء الحصة بنجاح')
        ).showCustomDialg(context);
        getLessons(unitId:unitId);
      }
   //   getUserProfile();
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
