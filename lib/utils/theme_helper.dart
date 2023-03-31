import 'package:event_mgmt_sys/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeHelper {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 36,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    )),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryColor,),
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(color: Colors.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            primary: buttonColor)),
    cardTheme: const CardTheme(
      margin: EdgeInsets.zero,
      color: cardColor,
    ),
    appBarTheme: const AppBarTheme(
        color: primaryColor,
        titleTextStyle: TextStyle(fontSize: 18),
        centerTitle: true),
    iconTheme: IconThemeData(color: buttonColor, size: 24),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 36,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    )),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: primaryColor,),
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(color: Colors.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            primary: buttonColor)),
    cardTheme: const CardTheme(
      margin: EdgeInsets.zero,
      color: cardColor,
    ),
    appBarTheme: const AppBarTheme(
        color: primaryColor,
        titleTextStyle: TextStyle(fontSize: 18),
        centerTitle: true),
    iconTheme: IconThemeData(color: buttonColor, size: 24),
  );
}
