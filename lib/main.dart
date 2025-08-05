import 'package:flutter/material.dart';
import 'package:my_submission_app/screens/mobile/pages/home_page.dart';
import 'package:my_submission_app/screens/mobile/login_page.dart';
import 'package:my_submission_app/screens/mobile/splash_screen.dart';
import 'package:my_submission_app/services/shared_prefs_services.dart';
import 'package:my_submission_app/theme/light_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightmode,

      home: MySplashScreen(),
    );
  }
}
