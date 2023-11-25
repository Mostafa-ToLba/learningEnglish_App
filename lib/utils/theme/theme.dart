import 'package:flutter/material.dart';
import '../color_resource/color_resources.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: ColorResources.white1,
  fontFamily: 'Poppins',
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