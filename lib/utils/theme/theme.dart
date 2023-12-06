import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';

/*
ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: ColorResources.white1,
  fontFamily: 'Roboto',
  primaryColor:ColorResources.primary,
  canvasColor:ColorResources.primary,
  colorScheme: ThemeData().colorScheme.copyWith(primary:
  ColorResources.primary),
  brightness: Brightness.light,
  cardColor: ColorResources.white1,
  hintColor: ColorResources.hintText,
  scrollbarTheme: ScrollbarThemeData(
    thickness: MaterialStatePropertyAll(5),
    minThumbLength: 20
  ),
  iconTheme:  IconThemeData(
    color: ColorResources.white1,
  ),
);

*/
enum AppTheme {
  light,
  dark,
}

final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    textTheme:const TextTheme(titleSmall:TextStyle(fontFamily: AppConstants.arabicFont1,) ) ,
    colorScheme: const ColorScheme.light(),
    //primaryColor: ColorResources.white1,
  ),
  AppTheme.dark: ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    //primaryColor: ColorResources.black,
  ),
};
