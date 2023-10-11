import 'package:flutter/material.dart';

// final ThemeData lightTheme = ThemeData.light();
// final ThemeData darkTheme = ThemeData.dark();

enum ThemeOption { light, dark, system }

class ThemeNotifier extends ChangeNotifier {
  late ThemeData _currentTheme;
  ThemeOption _themeOption = ThemeOption.system;

  ThemeNotifier() {
    _currentTheme = ThemeData.light();
    _themeOption = ThemeOption.system;
  }

  ThemeData get currentTheme => _currentTheme;
  ThemeOption get themeOption => _themeOption;

  setTheme(ThemeOption option) {
    _themeOption = option;
    if (option == ThemeOption.light) {
      _currentTheme = ThemeData.light();
    } else if (option == ThemeOption.dark) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme =
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark
              ? ThemeData.dark()
              : ThemeData.light();
    }
    notifyListeners();
  }
}


// class ThemeNotifier extends ChangeNotifier {
//   ThemeData _themeData;

//   ThemeNotifier(this._themeData);

//   getTheme() => _themeData;

//   setTheme(ThemeData themeData) {
//     _themeData = themeData;
//     notifyListeners();
//   }
// }
