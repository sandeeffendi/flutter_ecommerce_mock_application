import 'package:flutter/material.dart';
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
          backgroundColor: Colors.red,
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
        backgroundColor: Colors.green,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top container
              Container(
                color: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.only(
                  left: 37,
                  right: 37,
                  top: 100,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom > 0
                          ? 150
                          : 200,
                      child: Image.asset(
                        'assets/images/welcome_screen_basket.png',
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).viewInsets.bottom > 0
                          ? 150
                          : 250,
                      child: Image.asset(
                        'assets/images/welcome_screen_basket_shadow.png',
                      ),
                    ),
                  ],
                ),
              ),

              // Login form
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Text(
                      'Login To Explore More',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),

                    Form(
                      key: _keyForm,
                      child: Column(
                        children: [
                          MyTextFormField(
                            hintText: 'Email',
                            validator: _validateEmail,
                            controller: _emailController,
                          ),
                          const SizedBox(height: 8),
                          MyTextFormField(
                            hintText: 'Password',
                            validator: _validatePassword,
                            controller: _passwordController,
                            obscure: true,
                          ),
                          const SizedBox(height: 8),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: RawMaterialButton(
                              onPressed: _submitLoginForm,
                              fillColor: Theme.of(context).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Login',
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Create Account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: Theme.of(
                                  context,
                                ).textTheme.titleSmall?.copyWith(fontSize: 12),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyRegisterPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Create an account.',
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                          255,
                                          36,
                                          5,
                                          174,
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
            ],
          ),
        ),
      ),
    );
  }
}
