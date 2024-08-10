import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  /// dark theme
  static final darkTheme = ThemeData(
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: const Color.fromARGB(255, 40, 46, 49),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color.fromARGB(255, 162, 197, 217),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
      bodyMedium:
          TextStyle(color: Colors.grey, fontSize: 11, fontFamily: "vazir"),
      bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 162, 197, 217)),
      labelMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 162, 197, 217)),
      titleSmall: TextStyle(
        color: Colors.black,
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

  /// light theme
  static final lightTheme = ThemeData(
    useMaterial3: false,
    textTheme: TextTheme(
      /// version text
      labelSmall: GoogleFonts.openSans(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: const Color.fromARGB(255, 255, 255, 255)),

      /// splash main text
      titleMedium: GoogleFonts.playfairDisplay(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 255, 255)),

      /// main page titles
      titleLarge: GoogleFonts.roboto(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 255, 255)),

      /// container titles
      titleSmall: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 255, 255, 255)),

      bodyMedium: GoogleFonts.roboto(
          fontSize: 9,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 208, 207, 207)),

    ),

    // highlightColor: const Color.fromARGB(40, 157, 107, 14),
    // primaryColor: const Color.fromARGB(255, 255, 183, 0),
    // primaryColorDark: const Color.fromARGB(255, 128, 87, 0),

    highlightColor: const Color.fromARGB(40, 81, 14, 157),
    primaryColorLight: const Color.fromARGB(254, 208, 0, 27),
    primaryColor: const Color.fromARGB(255, 153, 0, 255),
    primaryColorDark: const Color.fromARGB(254, 154, 115, 255),
    scaffoldBackgroundColor: const Color.fromARGB(255,38, 40, 73),
    secondaryHeaderColor: const Color.fromARGB(255,46, 50, 92),
    dividerColor:  const Color.fromARGB(255,68, 63, 125),



    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.red),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )
        ),
      )
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(254, 72, 0, 255)
    ),

    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),



    shadowColor: Colors.grey,
    unselectedWidgetColor: Colors.blue.shade50,
    colorScheme: ColorScheme.fromSwatch().copyWith(background: Colors.white),
    iconTheme: IconThemeData(color: Colors.grey.shade800),
  );

}
