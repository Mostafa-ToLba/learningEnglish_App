import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';

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
  //  textTheme:const TextTheme(titleSmall:TextStyle(fontFamily: AppConstants.arabicFont1,) ) ,
 //   colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: ColorResources.grey5,
    indicatorColor: ColorResources.black,
    primaryColor: ColorResources.grey5,

    colorScheme: ColorScheme.light(primary: ColorResources.primary),
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
      titleSmall: TextStyle(),
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
      displayColor: ColorResources.appGreyColor,
    ),
    primaryIconTheme: IconThemeData(color: ColorResources.black),
    /*
      primaryTextTheme: Theme.of(context).textTheme.apply(
        bodyColor: Colors.pink,
        displayColor: Colors.pink,
      ),

    */
    /*
      textTheme: TextTheme(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppConstants.arabicFont2,
                      ),
                      */
    //primaryColor: ColorResources.white1,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorResources.grey5,
      unselectedIconTheme: IconThemeData(color: ColorResources.brownDark),
      selectedIconTheme: IconThemeData(color: ColorResources.white1),
      selectedItemColor: ColorResources.white1,
      unselectedItemColor: ColorResources.brownDark,
    ),
  ),
  AppTheme.dark: ThemeData(
    indicatorColor: ColorResources.white1,
    primaryColor: ColorResources.black,

    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
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
      //fontFamily

      bodyColor: ColorResources.white1,
      displayColor: ColorResources.white1,
    ),
    primaryIconTheme: IconThemeData(color: ColorResources.white1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorResources.blackBackground,
      unselectedIconTheme: IconThemeData(color: ColorResources.white1),
      selectedIconTheme: IconThemeData(color: ColorResources.white1),
      selectedItemColor: ColorResources.brownDark,
         unselectedItemColor: ColorResources.white1,
    ),
    //primaryColor: ColorResources.black,
  ),
};
