import 'package:flutter/material.dart';

const Color customPrimaryColor = Color.fromARGB(237, 8, 67, 125);
const Color customSecondaryColor = Color(0xFF121212);
const Color customAccentColor = Color(0xFF4F87DB);
const Color customBackground = Color(0xFF222834);
const Color customTextColor = Color(0xFFB6B5B5);
const Color customHintColor = Color(0xFF757575);
const Color customCardColor = Color(0xFF1E1E2A);

final ThemeData theme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xFF121212),
  cardColor: customCardColor,
  //* AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: customBackground,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: customTextColor,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: customTextColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: customTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: customTextColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: customSecondaryColor,
    ),
  ),
);
