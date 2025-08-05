import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNav extends StatelessWidget {
  void Function(int)? onTabChange;

  MyBottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GNav(
          activeColor: Theme.of(context).colorScheme.secondary,
          tabActiveBorder: Border.all(
            color: Theme.of(context).colorScheme.surface,
          ),
          tabBackgroundColor: Theme.of(context).colorScheme.primary,
          tabBorderRadius: 25,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          onTabChange: (value) => onTabChange!(value),
          tabs: [
            GButton(icon: Icons.home, text: 'Home', gap: 4),
            GButton(
              icon: Icons.shopping_basket_outlined,
              text: 'My Basket',
              gap: 4,
            ),
            GButton(icon: Icons.settings, text: 'Settings', gap: 4),
          ],
        ),
      ),
    );
  }
}
