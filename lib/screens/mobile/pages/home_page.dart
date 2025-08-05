import 'package:flutter/material.dart';
import 'package:my_submission_app/components/my_bottom_nav.dart';
import 'package:my_submission_app/screens/mobile/pages/basket_page.dart';
import 'package:my_submission_app/screens/mobile/pages/setting_page.dart';
import 'package:my_submission_app/services/shared_prefs_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: Create bottom nav bar index for navigation
  int _selectedIndex = 0;

  // Bottom navigation on selected index
  void navigateBottomNavbar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    //Home Page
    // HomePage(),

    // Basket Pages
    BasketPage(),

    // Settings Pages
    SettingPage(),
  ];

  // Set logout state
  Future<void> logout() async {
    final prefsService = SharedPrefsServices();
    prefsService.disposeLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: MyBottomNav(
        onTabChange: (index) => navigateBottomNavbar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
