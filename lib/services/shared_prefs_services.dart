//TODO: Make an abstraction of Login and Logout handler

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsServices {
  static const _keyLoggin = 'is_logged_in';
  static const _keyUsername = 'username';

  // Set Login state
  Future<void> saveLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('userEmail')?.split('@')[0];

    await prefs.setBool(_keyLoggin, true);
    if (username != null) {
      await prefs.setString(_keyUsername, username);
    }
  }

  // Set logout state
  Future<void> disposeLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLoggin, false);
  }

  // Getter username
  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }

  // Cek if user logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLoggin) ?? false;
  }
}
