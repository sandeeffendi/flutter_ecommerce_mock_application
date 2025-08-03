import 'package:flutter/material.dart';
import 'package:my_submission_app/theme/my_text_theme.dart';

ThemeData lightmode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Color(0xFFFFA451),

    secondary: Color(0xFF27214D),

    tertiary: Color(0xffF3F1F1),

    surface: Color(0xFFFFFFFF),

    error: Color(0xFFB00020),
    onError: Color(0xFFFFFFFF),

    inversePrimary: Color(0xFFE0E0E0),
  ),
  textTheme: myTextTheme,
);
