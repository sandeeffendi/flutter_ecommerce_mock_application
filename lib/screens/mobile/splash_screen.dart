import 'package:flutter/material.dart';
import 'package:my_submission_app/screens/mobile/pages/home_page.dart';
import 'package:my_submission_app/screens/mobile/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => MySplashScreenState();
}

class MySplashScreenState extends State<MySplashScreen> {
  //init state
  @override
  @override
  void initState() {
    super.initState();
    checkIsLoggedIn();
  }

  //check if user is logged in
  Future<void> checkIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;

    if (isLoggedIn) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    if (!isLoggedIn) {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyLoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
