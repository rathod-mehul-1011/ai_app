import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light();
final ThemeData darkTheme = ThemeData.dark();

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
