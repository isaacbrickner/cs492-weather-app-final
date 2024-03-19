import 'package:flutter/material.dart';
const colorSettings = ColorScheme(
  primary: Color.fromARGB(255, 97, 17, 80),
  onPrimary: Colors.white,
  secondary: Color.fromARGB(255, 255, 255, 255),
  onSecondary: Colors.white,
  tertiary: Color.fromARGB(255, 255, 214, 214),
  error: Color.fromARGB(255, 255, 17, 0),
  onError: Color.fromARGB(255, 255, 0, 0),
  background: Color.fromARGB(255, 255, 255, 255),
  onBackground: Colors.black,
  brightness: Brightness.light,
  surface: Color.fromARGB(255, 255, 255, 255),
  onSurface: Colors.black,
);

final mainTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    titleTextStyle: TextStyle(color: colorSettings.onPrimary)
  ),
  colorScheme: colorSettings,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: colorSettings.secondary,
      foregroundColor: colorSettings.onSecondary,
    ),
  ),
);