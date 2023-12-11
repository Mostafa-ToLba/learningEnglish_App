import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/cache_helper/cache_helper.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemesViewModel extends BaseNotifier {
  bool? isDark;

  void setTheme(bool value) {
    isDark = !value;
    CasheHelper.putBoolean(key: AppConstants.darkPreferences, value: !value);
    setSystemChrome();
    print(isDark);
    notifyListeners();
  }

  void getTheme() {
 //   isDark = sharedPreferences.getBool(modePrefKey) ?? false;
    switch (isDark) {
      case true:
        break;
      default:
   //     sharedPreferences.setBool(modePrefKey, false);
    }

    // isDark = Preference.getBool(PrefKeys.themeStatus)??false;
  }

  setSystemChrome()
  {
    isDark == false
        ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: ColorResources.white1,
    ))
        : SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorResources.buttonColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: ColorResources.black,
    ));
  }
}
