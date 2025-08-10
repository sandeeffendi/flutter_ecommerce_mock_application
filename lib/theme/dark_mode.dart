import 'package:flutter/material.dart';
import 'package:my_submission_app/theme/my_dark_text_theme.dart';

ThemeData darkmode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Color(0xFFFFA451),
    secondary: Color(0xFFE0E0E0),
    tertiary: Color.fromARGB(255, 190, 170, 140),

    surface: Color(0xFF121212),
    error: Color(0xFFCF6679),
    onError: Color(0xFF000000),

    inversePrimary: Color(0xFF27214D),
  ),
  textTheme: myDarkTextTheme,

  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.grey[900], // default background
    contentTextStyle: TextStyle(color: Colors.white),
  ),
);
