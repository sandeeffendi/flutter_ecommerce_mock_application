import 'package:flutter/material.dart';

class AboutPages extends StatelessWidget {
  const AboutPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            // Top Display
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(minimumSize: Size(10, 30)),
                    child: Icon(Icons.arrow_back, size: 24),
                  ),
                ),
              ),
            ),

            // Main Display
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          'About Fresh Hub',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 120,
                          left: 25,
                          right: 25,
                        ),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget sapien non nisi placerat laoreet. Integer nec odio et purus laoreet hendrerit. Suspendisse potenti. Curabitur ut dignissim purus. Nullam euismod, orci non convallis commodo, tortor orci faucibus purus, vel vehicula nibh odio at metus. Pellentesque vel dui sed ligula commodo sodales. Fusce in diam at justo egestas fringilla. Vestibulum ut hendrerit metus. Phasellus id velit sed odio faucibus eleifend. Etiam sollicitudin purus sed tincidunt dapibus. Vivamus sit amet orci id sapien pharetra fermentum. Ut id nisl sed purus interdum feugiat. Proin tincidunt sapien nec turpis luctus, eget facilisis ligula cursus. Sed vitae magna at libero pulvinar mattis. Curabitur vel felis non dolor hendrerit aliquet. Nunc et neque facilisis, ultricies nunc id, imperdiet erat. Praesent scelerisque purus vitae eros sollicitudin, sed convallis velit congue. Donec at erat ac velit blandit',
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
