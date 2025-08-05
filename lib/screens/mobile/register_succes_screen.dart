import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_submission_app/screens/mobile/login_page.dart';

class RegisterSuccesScreen extends StatefulWidget {
  final String? username;

  const RegisterSuccesScreen({super.key, required this.username});

  @override
  State<RegisterSuccesScreen> createState() => _RegisterSuccesState();
}

class _RegisterSuccesState extends State<RegisterSuccesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Success Animation
              SizedBox(
                height: 300,
                child: Lottie.asset(
                  "assets/animation/success.json",
                  repeat: false,
                ),
              ),

              // Headline Created account
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                child: Column(
                  children: [
                    Text(
                      'Account created!',
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    Text(
                      'Welcome ${widget.username}',
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    
                    // Back to Login page button
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primaryContainer,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyLoginPage(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.back,
                              color: Theme.of(context).colorScheme.surface,
                              size: 25,
                            ),
                            Text(
                              'Back to Login page',
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                  ),
                            ),
                          ],
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
    );
  }
}
