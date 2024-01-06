import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/cache_helper/cache_helper.dart';
import 'package:learning_anglish_app/data/models/educationLevels/educationLevels.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ChoosingClassViewModel extends BaseNotifier
{
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  int selectedIndex = 0;
  List<String> classList = [
    'الصف الأول الثانوي',
    'الصف الثاني الثانوي',
    'الصف الثالث الثانوي',
  ];
   EducationLevels educationLevelsModel = EducationLevels();
  void getEducationLevels() async {
    setBusy();
    try {
      Response<dynamic> res = await api.educationLevels();
      educationLevelsModel = EducationLevels.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  Future storeLevel()
  async{
    if(selectedIndex == 0)
      {
        CacheHelper.SaveData(key: PrefKeys.educationLevel, value: 1);
      }
    else if (selectedIndex==1)
    {
      CacheHelper.SaveData(key: PrefKeys.educationLevel, value: 2);
    }
    else if (selectedIndex==2)
    {
      CacheHelper.SaveData(key: PrefKeys.educationLevel, value: 3);
    }
  }
}
