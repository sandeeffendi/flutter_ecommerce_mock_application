import 'package:flutter/material.dart';
import 'package:my_submission_app/components/my_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key});

  @override
  State<MyRegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<MyRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool isValidate = false;

  // Email, Password, Confirm Password Controller Instances
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Email Validator
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      isValidate = false;
      return 'Please input your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      isValidate = false;
      return 'Email is invalid, please input correct email address';
    }
    isValidate = true;
    return null;
  }

  // Password Validator
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      isValidate = false;
      return 'Please input your password';
    } else if (value.length < 6) {
      isValidate = false;
      return 'Password length must be 6 character or more';
    } else {
      isValidate = true;
      return null;
    }
  }

  // Confirm Password Validator
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      isValidate = false;
      return '\'Confirm Password\' cannot be empty';
    } else if (_passwordController.text != _confirmPasswordController.text) {
      isValidate = false;
      return 'Password not match';
    } else {
      isValidate = true;
      return null;
    }
  }

  // Email, Password, Confirm Password Form Handler
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();
      final String email = _emailController.text;
      final String password = _passwordController.text;

      await prefs.setString('userEmail', email);
      await prefs.setString('userPassword', password);

      debugPrint(
        '${prefs.getString('userEmail')}${prefs.getString('userPassword')}',
      );
    }
    return;
  }

  // Dispose State
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Center(child: Icon(Icons.message, size: 150)),

                  SizedBox(height: 8),

                  // Create An Account Text
                  Text(
                    'Create An Account',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),

                  SizedBox(height: 8),

                  // Email Input
                  MyTextFormField(
                    hintText: "Email",
                    controller: _emailController,
                    validator: _validateEmail,
                  ),

                  SizedBox(height: 8),

                  // Password Input
                  MyTextFormField(
                    hintText: "password",
                    controller: _passwordController,
                    obscure: true,
                    validator: _validatePassword,
                  ),

                  SizedBox(height: 8),

                  // Confirm Password Input
                  MyTextFormField(
                    hintText: "Confirm Password",
                    controller: _confirmPasswordController,
                    obscure: true,
                    validator: _validateConfirmPassword,
                  ),

                  SizedBox(height: 15),

                  // Create An Account Button
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      child: Text(
                        'Create An Account',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
