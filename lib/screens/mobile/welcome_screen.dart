import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image Display Container
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.only(left: 37, right: 37, top: 155),
              color: Theme.of(context).colorScheme.primary,
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset('assets/images/welcome_screen_basket.png'),
                  SizedBox(height: 8),
                  Image.asset('assets/images/welcome_screen_basket_shadow.png'),
                ],
              ),
            ),
          ),

          // Form Display Container
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(
                top: 56,
                bottom: 88,
                left: 24,
                right: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get The Freshest Fruit Salad Combo',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'We deliver the best and freshest fruit salad in',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        'town. Order for a combo today!!!',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: RawMaterialButton(
                      onPressed: () {},
                      fillColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Let\'s Continue',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
