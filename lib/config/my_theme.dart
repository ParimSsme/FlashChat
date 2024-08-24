import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// dark theme
final darkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  scaffoldBackgroundColor: const Color.fromARGB(255, 40, 46, 49),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Colors.white30,
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Color.fromARGB(255, 162, 197, 217),
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
        color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
    bodyMedium:
    TextStyle(color: Colors.grey, fontSize: 11,),
    bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 162, 197, 217)),
    labelMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 162, 197, 217)),
    titleSmall: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
  ),
  primaryColor: const Color.fromARGB(255, 255, 39, 63),
  highlightColor: const Color.fromARGB(255, 38, 69, 255),


  secondaryHeaderColor: const Color.fromARGB(255, 255, 60, 150),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    background: const Color.fromARGB(255, 36, 44, 52),
  ),
  shadowColor: const Color.fromARGB(145, 19, 19, 19),
  unselectedWidgetColor: Colors.grey,
  iconTheme: const IconThemeData(color: Colors.white70),
);


