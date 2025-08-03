import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_submission_app/components/my_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _keyForm = GlobalKey<FormState>();

  // Email Password Text Controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // FORM HANDLER
  // Email Password Form Handler
  Future<void> _submitLoginForm() async {
    final prefs = await SharedPreferences.getInstance();

    if (!_keyForm.currentState!.validate()) {
      return;
    }
    if (prefs.getString('userEmail') != _emailController.text) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email is not registered'),
          duration: Duration(seconds: 1),
        ),
      );
      return;
    }
    if (prefs.getString('userPassword') != _passwordController.text) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password is invalid'),
          duration: Duration(seconds: 1),
        ),
      );
      return;
    }

    // TODO
    // Login Succes Navigate to HomePage
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Login succesfull'),
        duration: Duration(seconds: 1),
      ),
    );
    return;
  }

  // Email Password Validator
  // Email Validator
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please input your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email is invalid, please input correct email address';
    }
    return null;
  }

  // Password Validator
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please input your password';
    } else if (value.length < 6) {
      return 'Password length must be 6 character or more';
    } else {
      return null;
    }
  }

  // Dispose
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
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Form(
                  key: _keyForm,
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
                      MyTextFormField(
                        validator: _validateEmail,
                        hintText: "Email",
                        controller: _emailController,
                      ),

                      SizedBox(height: 8),

                      // Password Input
                      MyTextFormField(
                        validator: _validatePassword,
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
                          onPressed: _submitLoginForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
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

                SizedBox(height: 15),

                // Dont have an Account? Create An Account.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Create an account.',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
