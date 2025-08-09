import 'package:flutter/material.dart';
import 'package:my_submission_app/screens/mobile/pages/home_page.dart';
import 'package:my_submission_app/screens/mobile/pages/profile_pages.dart';
import 'package:my_submission_app/screens/mobile/splash_screen.dart';
import 'package:my_submission_app/theme/light_mode.dart';
import 'package:provider/provider.dart';
import 'model/cart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightmode,

        home: HomePage(),
      ),
    );
  }
}
