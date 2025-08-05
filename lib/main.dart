import 'package:flutter/material.dart';
import 'package:my_submission_app/screens/mobile/login_page.dart';
import 'package:my_submission_app/theme/light_mode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightmode,

      home: MyLoginPage(),
    );
  }
}
