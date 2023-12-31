import 'package:fl_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
 
import 'package:google_fonts/google_fonts.dart';


class MyThemes {
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        scaffoldBackgroundColor: MyColors.kDarkBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: MyColors.kDarkBackgroundColor2,
          centerTitle: true,
          elevation: 2,
        ),
        primaryTextTheme:  const TextTheme(
          bodyLarge: TextStyle(color: MyColors.kPrimaryLightTextcolor),
          bodyMedium: TextStyle(color: MyColors.kSecondaryLightTextcolor),
        ),
        iconTheme: const IconThemeData(color: MyColors.kPrimaryLightTextcolor),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: MyColors.kDarkBackgroundColor2,
          unselectedItemColor: MyColors.kSecondaryLightTextcolor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(size: 30),
          type: BottomNavigationBarType.fixed,
        ), colorScheme: ColorScheme.light(
          
          brightness: Brightness.dark,
          primary: Colors.black,
          secondary: Colors.black.withOpacity(0.4),
          tertiary: Colors.black.withOpacity(0),
        ).copyWith(background: Colors.black),
      );

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        scaffoldBackgroundColor: MyColors.kLightBackgroundColor,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: MyColors.kLightBackgroundColor2,
          elevation: 2,
        ),
        primaryTextTheme:  const TextTheme(
          bodyLarge: TextStyle(color: MyColors.kPrimaryDarkTextcolor),
          bodyMedium: TextStyle(color: MyColors.kSecondaryDarkTextcolor),
        ),
        iconTheme: const IconThemeData(color: MyColors.kPrimaryDarkTextcolor),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: MyColors.kLightBackgroundColor2,
          unselectedItemColor: MyColors.kSecondaryDarkTextcolor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(size: 30),
          type: BottomNavigationBarType.fixed,
        ), colorScheme: ColorScheme.light(
          
          brightness: Brightness.light,
          primary: Colors.white,
          secondary: Colors.white.withOpacity(0.4),
          tertiary: Colors.white.withOpacity(0),
        ).copyWith(background: Colors.white),
      );
}
