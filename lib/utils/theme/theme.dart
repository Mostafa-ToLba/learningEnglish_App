import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';

enum AppTheme {
  light,
  dark,
}

final appThemeData = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorResources.grey5,
    indicatorColor: ColorResources.black,
    primaryColor: ColorResources.grey5,
    colorScheme: ColorScheme.light(primary: ColorResources.primary,background:Colors.white),
    fontFamily: "Roboto",
    textTheme: const TextTheme(
      displayLarge: TextStyle(),
      displayMedium: TextStyle(),
      displaySmall: TextStyle(),
      headlineLarge: TextStyle(),
      headlineMedium: TextStyle(),
      headlineSmall: TextStyle(),
      titleLarge: TextStyle(),
      titleMedium: TextStyle(),
      titleSmall:TextStyle(),
      bodyLarge: TextStyle(),
      bodyMedium: TextStyle(),
      bodySmall: TextStyle(),
      labelLarge: TextStyle(),
      labelMedium: TextStyle(),
      labelSmall: TextStyle(),
    ).apply(
      //fontFamily
      fontFamily: AppConstants.arabicFont1,
      bodyColor: ColorResources.appGreyColor,
      displayColor: ColorResources.black,
    ),
    primaryIconTheme: IconThemeData(color: ColorResources.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorResources.white1,
      unselectedIconTheme: IconThemeData(color: ColorResources.brownDark),
      selectedIconTheme: IconThemeData(color: ColorResources.white1),
      selectedItemColor: ColorResources.white1,
      unselectedItemColor: ColorResources.brownDark,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.black,)
  ),
  AppTheme.dark: ThemeData(
    indicatorColor: ColorResources.white1,
    primaryColor: ColorResources.black,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(primary: ColorResources.primary,background:HexColor('#131414')),
    fontFamily: "Roboto",
    scaffoldBackgroundColor: ColorResources.blackBackground,
    textTheme: const TextTheme(
      displayLarge: TextStyle(),
      displayMedium: TextStyle(),
      displaySmall: TextStyle(),
      headlineLarge: TextStyle(),
      headlineMedium: TextStyle(),
      headlineSmall: TextStyle(),
      titleLarge: TextStyle(),
      titleMedium: TextStyle(),
      titleSmall: TextStyle(),
      bodyLarge: TextStyle(),
      bodyMedium: TextStyle(),
      bodySmall: TextStyle(),
      labelLarge: TextStyle(),
      labelMedium: TextStyle(),
      labelSmall: TextStyle(),
    ).apply(
      fontFamily: AppConstants.arabicFont1,
      bodyColor: ColorResources.white1,
      displayColor: ColorResources.white1,
    ),
    primaryIconTheme: IconThemeData(color: ColorResources.white1,),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorResources.blackBackground,
      unselectedIconTheme: IconThemeData(color: ColorResources.white1,),
      selectedIconTheme: IconThemeData(color: ColorResources.white1),
      selectedItemColor: ColorResources.brownDark,
         unselectedItemColor: ColorResources.white1,
    ),
    //primaryColor: ColorResources.black,
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white)
  ),
};
