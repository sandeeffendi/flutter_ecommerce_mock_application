import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier {
  bool _isLightMode = true;

  // Getter isLightMode value
  bool get isLightMode => _isLightMode;

  void ToggleTheme() {
    _isLightMode = !_isLightMode;
    notifyListeners();
  }
}
