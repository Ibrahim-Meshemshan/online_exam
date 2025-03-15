import 'package:flutter/material.dart';

class ThemeManager {
  static Color whiteColor = const Color(0xffffffff);
  static Color blackColor = const Color(0xff000000);
  static Color buttonColor = const Color(0xff02369c);

  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: blackColor, fontSize: 20, fontWeight: FontWeight.w500),
        iconTheme: IconThemeData(color: blackColor)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xffEDEFF3),
        selectedIconTheme: IconThemeData(
          color: ThemeManager.buttonColor,
        ),
        selectedItemColor: buttonColor,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        )),
    textTheme: TextTheme(
      titleMedium: TextStyle(
          color: whiteColor, fontSize: 16, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(
          color: whiteColor, fontSize: 14, fontWeight: FontWeight.w300),
    ),
  );
}
