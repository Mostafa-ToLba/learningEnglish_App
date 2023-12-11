import 'package:flutter/material.dart';

class AppConstants {

  static const String baseUrl = '';

  static const String arabicFont1 = 'Tajawal';
  static const String arabicFont2 = 'ElMessiri';
  static const String darkPreferences = 'ElMessiri';
  static bool? dark ;

}


class SlideTransition1 extends PageRouteBuilder {
  final Widget page;
  SlideTransition1(this.page)
      : super(
      pageBuilder: (context, animation, anotherAnimation) => page,
      transitionDuration: Duration(milliseconds: 1000),
      reverseTransitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            parent: animation,
            reverseCurve: Curves.fastOutSlowIn);
        return SlideTransition(
          position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
              .animate(animation),
          child: page,
        );
      });
}