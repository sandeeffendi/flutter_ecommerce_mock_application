import 'package:flutter/material.dart';
import 'package:my_submission_app/screens/mobile/pages/home_page.dart';
import 'package:my_submission_app/screens/mobile/pages/profile_pages.dart';
import 'package:my_submission_app/screens/mobile/pages/setting_page.dart';
import 'package:my_submission_app/screens/mobile/splash_screen.dart';
import 'package:my_submission_app/theme/ThemeProvider.dart';
import 'package:my_submission_app/theme/light_mode.dart';
import 'package:my_submission_app/theme/dark_mode.dart';
import 'package:provider/provider.dart';
import 'model/cart.dart';
import 'screens/mobile/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Themeprovider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isLightMode ? lightmode : darkmode,

      home: MySplashScreen(),
    );
  }
}
