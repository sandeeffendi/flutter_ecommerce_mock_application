import 'package:flutter/material.dart';
import 'package:my_submission_app/components/my_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  // Email Password Text Controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Email Password Shared Preferences Instances
  Future<void> _getEmailPassword() async {
    final prefs = await SharedPreferences.getInstance();
    bool isEmailSaved = await prefs.setString(
      'userEmail',
      _emailController.text,
    );
    bool isPasswordSaved = await prefs.setString(
      'userPassword',
      _passwordController.text,
    );

    debugPrint(
      isEmailSaved && isPasswordSaved
          ? 'email: ${prefs.getString('userEmail')} password: ${prefs.getString('userPassword')}'
          : 'error',
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Center(child: Icon(Icons.chat_rounded, size: 100)),

            SizedBox(height: 8),

            // Welcome Back
            Text(
              'Welcome back. you\'ve been miseed.',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),

            SizedBox(height: 8),

            // Email Input
            MyTextfield(hintText: "Email", controller: _emailController),

            SizedBox(height: 8),

            // Password Input
            MyTextfield(
              hintText: "Password",
              obscure: true,
              controller: _passwordController,
            ),

            SizedBox(height: 15),

            // Login Button
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _getEmailPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
