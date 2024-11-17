import 'package:flutter/material.dart';

class AppTheme {
  static const Color kPrimaryColor = Colors.blue;
  static const Color kSecondaryColor = Colors.lightBlueAccent;
  static const Color kForegroundColor = Colors.white;
  static const Color kBackgroundColor = Colors.black;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    backgroundColor: kBackgroundColor,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: kForegroundColor),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: kPrimaryColor,
    backgroundColor: kBackgroundColor,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: kForegroundColor),
    ),
  );
}
