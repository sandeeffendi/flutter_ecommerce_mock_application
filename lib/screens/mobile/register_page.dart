import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_submission_app/components/my_text_form_field.dart';
import 'package:my_submission_app/screens/mobile/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key});

  @override
  State<MyRegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<MyRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  // Email, Password, Confirm Password Controller Instances
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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

  // Confirm Password Validator
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return '\'Confirm Password\' cannot be empty';
    } else if (_passwordController.text != _confirmPasswordController.text) {
      return 'Password not match';
    } else {
      return null;
    }
  }

  // FORM HANDLER
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

    //TODO
    // Create Account Success
    // Navifate to Success
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
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isKeyboardView = MediaQuery.of(context).viewInsets.bottom > 0;

          final screenHeight = MediaQuery.of(context).size.height;
          final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
          final availableHeight = screenHeight - keyboardHeight;

          final topHeight = availableHeight * 4 / 7;
          final bottomHeight = availableHeight * 3 / 7;

          return Stack(
            children: [
              SingleChildScrollView(
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
                                'assets/images/register_screen_basket.png',
                              ),
                            ),
                            SizedBox(height: 8),
                            Image.asset(
                              'assets/images/register_screen_basket_shadow.png',
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
                              'Create An Account',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),

                            // Create An Account Form
                            SizedBox(height: 8),
                            Form(
                              key: _formKey,
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
                                  MyTextFormField(
                                    hintText: 'Confirm Password',
                                    validator: _validateConfirmPassword,
                                    controller: _confirmPasswordController,
                                    obscure: true,
                                  ),

                                  SizedBox(height: 8),

                                  // Create An Account Button
                                  SizedBox(
                                    width: double.infinity,
                                    height: 56,
                                    child: RawMaterialButton(
                                      onPressed: _submitForm,
                                      fillColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        'Crate An Account',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(color: Colors.white),
                                      ),
                                    ),
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
              ),
              Positioned(
                top: 55,
                left: 10,
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyLoginPage(),
                            ),
                          );
                        },
                        fillColor: Color.fromRGBO(165, 165, 165, 0.434),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          CupertinoIcons.back,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Back To Login',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
