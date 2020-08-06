import 'package:flutter/material.dart';

enum ThemeType {
  light,
  dark,
}

class ThemeManager with ChangeNotifier {
  ThemeData themeData;

  ThemeType themeType;

  ThemeManager(ThemeType type) {
    themeType = type;
    if (type == ThemeType.dark) {
      themeData = ThemeData.light();
    } else {
      themeData = ThemeData.dark();
    }
  }

  void changeTheme() {
    if (themeType == ThemeType.light) {
      _updateTheme(ThemeType.dark);
    } else {
      _updateTheme(ThemeType.light);
    }
  }

  void _updateTheme(ThemeType type) {
    themeType = type;
    if (themeType == ThemeType.dark) {
      themeData = ThemeData.light();
    } else {
      themeData = ThemeData.dark();
    }
    notifyListeners();
  }
}
