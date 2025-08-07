import 'package:flutter/material.dart';
import 'package:my_submission_app/theme/my_text_theme.dart';

ThemeData lightmode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Color(0xFFFFA451),

    secondary: Color(0xFF27214D),

    tertiary: Color.fromARGB(255, 220, 203, 169),

    surface: Color(0xFFFFFFFF),

    error: Color(0xFFB00020),
    onError: Color(0xFFFFFFFF),

    inversePrimary: Color(0xFFE0E0E0),
  ),
  textTheme: myTextTheme,

  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.grey[900], // default background
    contentTextStyle: TextStyle(color: Colors.white),
  ),
);
