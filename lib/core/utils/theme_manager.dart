import 'package:flutter/material.dart';

class ThemeManager {
  static Color whiteColor = const Color(0xffffffff);
  static Color blackColor = const Color(0xff000000);
  static Color buttonColor = const Color(0xff02369c);


  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: blackColor,fontSize: 20,fontWeight: FontWeight.w500),
        iconTheme: IconThemeData(color: blackColor)),

    textTheme: TextTheme(
      titleMedium: TextStyle(
          color: whiteColor, fontSize: 16, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(
          color: whiteColor, fontSize: 14, fontWeight: FontWeight.w300),
    ),

  );
}