import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier {
  bool _isLightMode = true;

  // Getter isLightMode value
  bool get isLightMode => _isLightMode;

  void toggleTheme() {
    _isLightMode = !_isLightMode;
    notifyListeners();
  }
}
