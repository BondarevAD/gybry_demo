import 'package:flutter/material.dart';
import 'package:gybry_demo/presentation/utils/app_colors.dart';
import 'package:gybry_demo/presentation/utils/app_text_styles.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: darkPurple,
    secondary: darkPurple.withOpacity(0.8),
    surface: white,
    background: white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: darkPurple,
    foregroundColor: white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkPurple,
      foregroundColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: darkPurple, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.black87),
    bodyMedium: descriptionFont,
  ),
  scaffoldBackgroundColor: white,
  cardTheme: CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);
