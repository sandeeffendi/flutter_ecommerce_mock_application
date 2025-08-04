import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_submission_app/components/my_text_form_field.dart';
import 'package:my_submission_app/screens/mobile/register_page.dart';
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
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isKeyboardView = MediaQuery.of(context).viewInsets.bottom > 0;

          final screenHeight = MediaQuery.of(context).size.height;
          final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
          final availableHeight = screenHeight - keyboardHeight;

          final topHeight = availableHeight * 4 / 7;
          final bottomHeight = availableHeight * 3 / 7;

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Theme.of(context).colorScheme.primary,
                  width: double.infinity,
                  height: topHeight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 37, right: 37, top: 155),
                    child: Column(
                      children: [
                        SizedBox(
                          height: isKeyboardView ? 50 : 260,
                          child: Image.asset(
                            'assets/images/welcome_screen_basket.png',
                          ),
                        ),
                        SizedBox(height: 8),
                        Image.asset(
                          'assets/images/welcome_screen_basket_shadow.png',
                        ),
                      ],
                    ),
                  ),
                ),

                // Form Display Container
                SizedBox(
                  height: bottomHeight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 24,
                      right: 24,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Login To Explore More',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),

                        // Login Form
                        SizedBox(height: 8),
                        Form(
                          key: _keyForm,
                          child: Column(
                            children: [
                              //Email Input
                              MyTextFormField(
                                hintText: 'Email',
                                validator: _validateEmail,
                                controller: _emailController,
                              ),

                              SizedBox(height: 8),

                              // Password Input
                              MyTextFormField(
                                hintText: 'Password',
                                validator: _validatePassword,
                                controller: _passwordController,
                                obscure: true,
                              ),

                              SizedBox(height: 8),

                              // Login Button
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: RawMaterialButton(
                                  onPressed: _submitLoginForm,
                                  fillColor: Theme.of(
                                    context,
                                  ).colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    'Login',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ),
                              ),

                              // Dont have an account? Create an Account
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Don\'t have an account?',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MyRegisterPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Create an account.',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                          255,
                                          73,
                                          32,
                                          255,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
