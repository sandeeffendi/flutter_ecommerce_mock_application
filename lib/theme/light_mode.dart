import 'package:flutter/material.dart';
import 'package:my_submission_app/theme/my_text_theme.dart';

ThemeData lightmode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Color(0xFFE1DFA0),

    secondary: Color(0xFF1E1E1E),

    tertiary: Color(0xFF939436),

    surface: Color(0xFFF5F5F5),

    error: Color(0xFFB00020),
    onError: Color(0xFFFFFFFF),

    inversePrimary: Color(0xFFE0E0E0),
  ),
  textTheme: myTextTheme
);
