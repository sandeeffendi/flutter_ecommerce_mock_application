import 'package:flutter/material.dart';
import 'package:my_submission_app/components/my_bottom_nav.dart';
import 'package:my_submission_app/screens/mobile/pages/basket_page.dart';
import 'package:my_submission_app/screens/mobile/pages/shop_page.dart';
import 'package:my_submission_app/screens/mobile/splash_screen.dart';
import 'package:my_submission_app/services/shared_prefs_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Set Logout Method
  Future<void> setLogout() async {
    final prefsService = SharedPrefsServices();
    prefsService.disposeLoginStatus();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => MySplashScreen()),
    );
  }

  // Bottom navigation on selected index
  void navigateBottomNavbar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    // Shop Page
    ShopPage(),

    // Basket Page
    BasketPage(),

    // ActivityPage
  ];

  // Set logout state
  Future<void> logout() async {
    final prefsService = SharedPrefsServices();
    prefsService.disposeLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),

      // Drawer
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset('assets/images/welcome_screen_basket.png'),
                ),
                Padding(padding: EdgeInsets.all(25), child: Divider()),

                // Pages
                Padding(
                  padding: EdgeInsets.all(25),
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                  ),
                ),

                Padding(
                  padding: EdgeInsetsGeometry.all(25),
                  child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text(
                      'About',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ],
            ),

            // TODO: Create dark mode, light mode toggle

            // Logout Button
            Container(
              alignment: Alignment.bottomRight,
              child: RawMaterialButton(
                onPressed: setLogout,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Log Out',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    Icon(Icons.logout),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Nav
      bottomNavigationBar: MyBottomNav(
        onTabChange: (index) => navigateBottomNavbar(index),
      ),

      // Body
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: _pages[_selectedIndex],
    );
  }
}
