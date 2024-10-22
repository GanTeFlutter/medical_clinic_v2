import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool _isLightTheme = false;
  bool _isDarkTheme = false;
  bool _isSystemTheme = false;
  bool _isProfileBlur = false;

  bool get isSystemTheme => _isSystemTheme;
  bool get isDarkTheme => _isDarkTheme;
  bool get isLightTheme => _isLightTheme;
  bool get isProfileBlur => _isProfileBlur;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    loadThemeFromHive();
  }

  void _toggleProfileBlur(bool value) {
    _isProfileBlur = value;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _toggleProfileBlur(true);

    await Future.delayed(const Duration(seconds: 1)); // 2 saniye bekle

    //theme burada degısıyor
    _themeMode = mode;

    if (mode == ThemeMode.dark) {
      _isDarkTheme = true;
      _isLightTheme = false;
      _isSystemTheme = false;
    } else if (mode == ThemeMode.light) {
      _isDarkTheme = false;
      _isLightTheme = true;
      _isSystemTheme = false;
    } else if (mode == ThemeMode.system) {
      _isDarkTheme = false;
      _isLightTheme = false;
      _isSystemTheme = true;
    }

    notifyListeners();

    var box = await Hive.openBox('settings');
    await box.put('themeMode', mode.index);

    await Future.delayed(const Duration(seconds: 1));

    _toggleProfileBlur(false);
  }

  void loadThemeFromHive() async {
    var box = await Hive.openBox('settings');
    int? savedThemeMode = box.get('themeMode');

    if (savedThemeMode != null) {
      _themeMode = ThemeMode.values[savedThemeMode];

      if (_themeMode == ThemeMode.dark) {
        _isDarkTheme = true;
        _isLightTheme = false;
        _isSystemTheme = false;
      } else if (_themeMode == ThemeMode.light) {
        _isDarkTheme = false;
        _isLightTheme = true;
        _isSystemTheme = false;
      } else if (_themeMode == ThemeMode.system) {
        _isDarkTheme = false;
        _isLightTheme = false;
        _isSystemTheme = true;
      }

      notifyListeners();
    }
  }
}
