// crear una clase provider para cambiar tema

import 'package:flutter/material.dart';

import '../enums/theme_enum.dart';
import '../share_preference/preferences.dart';
import 'styles/custom_theme.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData? currentTheme;

  bool isDarkMode = false;
  bool isSytemTheme = false;
  bool isCustomTheme = false;

  late ThemeEnum optionTheme;

  ThemeChanger({this.optionTheme = ThemeEnum.system}) {
    if (optionTheme == ThemeEnum.light) {
      themeLight();
    } else if (optionTheme == ThemeEnum.dark) {
      themeDark();
    } else if (optionTheme == ThemeEnum.system) {
      themeSystem();
    } else {
      themeCustom();
    }
    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        _onPlatformBrightnessChanged;
  }

  void setLightMode() {
    themeLight();
    Preferences.optionTheme = ThemeEnum.light;
    notifyListeners();
  }

  void setDarkMode() {
    themeDark();
    Preferences.optionTheme = ThemeEnum.dark;
    notifyListeners();
  }

  void setSystemMode() {
    themeSystem();
    Preferences.optionTheme = ThemeEnum.system;
    notifyListeners();
  }

  void setCustom() {
    themeCustom();
    Preferences.optionTheme = ThemeEnum.custom;
    notifyListeners();
  }

  void themeLight() {
    currentTheme = CustomTheme.light;
    isDarkMode = false;
    isSytemTheme = false;
    isCustomTheme = false;
  }

  void themeDark() {
    currentTheme = CustomTheme.dark;
    isDarkMode = true;
    isSytemTheme = false;
    isCustomTheme = false;
  }

  void themeSystem() {
    // Determina si el tema actual del sistema operativo es oscuro
    bool isModeDark =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;

    currentTheme = isModeDark
        ? CustomTheme.dark
        : CustomTheme.light; // Establece el tema actual
    isDarkMode = false;
    isCustomTheme = false;
    isSytemTheme = true;
  }

  void themeCustom() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    currentTheme = CustomTheme.getCustom(brightness);
    isDarkMode = false;
    isSytemTheme = false;
    isCustomTheme = true;
  }

// Método que se ejecuta cuando cambia el tema del sistema
  void _onPlatformBrightnessChanged() {
    if (isSytemTheme) {
      themeSystem();
    }
    if (isCustomTheme) {
      themeCustom();
    }

    notifyListeners();
  }
}
