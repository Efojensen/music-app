import 'package:flutter/material.dart';
import 'package:music_player/themes/dark_mode.dart';
import 'package:music_player/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _currentTheme = lightMode;

  ThemeData get currentTheme => _currentTheme;

  bool get isDarkMode => currentTheme == darkMode;

  set themeData(ThemeData newTheme){
    _currentTheme = newTheme;
  }

  void switchTheme(){
    if(_currentTheme == lightMode){
      _currentTheme = darkMode;
    }else{
      _currentTheme = lightMode;
    }
    notifyListeners();
  }
}