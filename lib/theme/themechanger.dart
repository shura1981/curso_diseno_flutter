// crear una clase provider para cambiar tema

import 'package:flutter/material.dart';

import '../enums/theme_enum.dart';
import '../share_preference/preferences.dart';
import 'styles/card_custom_style.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData? currentTheme;

  static Color colorFontMenuItem = Colors.white;
  static Color colorIconMenuItem = Colors.white;

//  ligth
  static Color themePrimaryLight = Colors.lightBlue;
  static Color themePrimaryColorLightDark =
      const Color.fromARGB(255, 18, 89, 210);
  static Color themePrimaryColorLight =
      const Color.fromARGB(255, 146, 146, 146);
  static Color themePrimaryColorLightScheme =
      const Color.fromARGB(255, 11, 77, 219);
  static Color themeSecondaryColorLightScheme =
      const Color.fromARGB(255, 180, 6, 151);

// dark
  static Color themePrimaryDark = const Color.fromRGBO(233, 30, 99, 1);
  static Color themePrimaryColorDark = const Color.fromRGBO(211, 17, 83, 1);
  static Color themePrimaryColorDarkScheme =
      const Color.fromRGBO(233, 30, 99, 1);
  static Color themeSecondaryColorDarkScheme = Colors.lightBlueAccent;
  static Color themeBackgroundScaffold = const Color.fromARGB(255, 29, 29, 29);

  bool isDarkMode = false;
  bool isSytemTheme = false;
  bool isCustomTheme = false;

  late ThemeEnum optionTheme;

  static ThemeData light = ThemeData.light().copyWith(
       extensions: <ThemeExtension<dynamic>>[
        CardCustomStyle(
          backgroundColor: const Color.fromARGB(255, 241, 241, 241),
          borderRadius: const Color.fromARGB(255, 42, 255, 4),
          color: themePrimaryColorLightDark,
        )
      ],
      primaryColor: themePrimaryLight,
      primaryColorDark: themePrimaryColorLightDark,
      colorScheme: ColorScheme.light(
        primary: themePrimaryColorLightScheme,
        secondary: themeSecondaryColorLightScheme,
      ),
      primaryColorLight: themePrimaryColorLight,
      canvasColor: Colors.grey[300],
      brightness: Brightness.light,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: themePrimaryLight,
        unselectedItemColor: const Color.fromARGB(255, 69, 69, 69),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: themePrimaryColorLightDark,
          foregroundColor: Colors.white),
      dividerTheme: const DividerThemeData(
        color: Color.fromARGB(95, 57, 156, 255),
        thickness: 1,
      ));

  static ThemeData dark = ThemeData.dark().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        CardCustomStyle(
          backgroundColor: const Color.fromARGB(255, 61, 61, 61),
          borderRadius: const Color.fromARGB(255, 29, 29, 29),
          color: themePrimaryColorDark,
        )
      ],
      primaryColor: themePrimaryDark,
      primaryColorDark: themePrimaryColorDark,
      primaryColorLight: themePrimaryColorLight,
      colorScheme: ColorScheme.dark(
        primary: themePrimaryColorDarkScheme,
        secondary: themeSecondaryColorDarkScheme,
      ),
      canvasColor: const Color.fromARGB(255, 26, 26, 26),
      brightness: Brightness.dark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: themePrimaryDark,
        unselectedItemColor: Colors.white,
      ),
      scaffoldBackgroundColor: themeBackgroundScaffold,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: themePrimaryColorDark,
          foregroundColor: Colors.white),
      dividerTheme: const DividerThemeData(
        color: Color.fromARGB(96, 255, 36, 226),
        thickness: 1,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 63, 63, 63),
      ));

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
    currentTheme = light;
    isDarkMode = false;
    isSytemTheme = false;
    isCustomTheme = false;
  }

  void themeDark() {
    currentTheme = dark;
    isDarkMode = true;
    isSytemTheme = false;
    isCustomTheme = false;
  }

  void themeSystem() {
    // Determina si el tema actual del sistema operativo es oscuro
    bool isModeDark =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;

    currentTheme = isModeDark ? dark : light; // Establece el tema actual
    isDarkMode = false;
    isCustomTheme = false;
    isSytemTheme = true;
  }

  void themeCustom() {
    currentTheme = light;
    isDarkMode = false;
    isSytemTheme = false;
    isCustomTheme = true;
  }
}
