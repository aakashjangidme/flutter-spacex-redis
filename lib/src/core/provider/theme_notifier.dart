import 'package:flutter/material.dart';
import 'package:tesla_redis/src/core/services/storage_service.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  set darkMode(bool value) {
    _darkMode = value;

    /// Sets theme prefrence in local storage
    StorageUtil.putBool('_darkMode', value);

    notifyListeners();
  }

  /// Gets & sets darkMode from localStorage
  void getDarkModeFromLocalStorage() {
    _darkMode = StorageUtil.getBool('_darkMode');
  }

  ThemeNotifier() {
    getDarkModeFromLocalStorage();
  }
}
