import 'package:shared_preferences/shared_preferences.dart';

import '../enums/theme_enum.dart';


class Preferences {
  // Shared preferences instance
  static late SharedPreferences _prefs;
  static bool _isDarkMode = false;
  static ThemeEnum _optionTheme = ThemeEnum.system;

  // Clear all preferences
  static Future<bool> clearAll() async {
    try {
      return await _prefs.clear();
    } catch (error) {
      return false; // Devuelve false si hay un error
    }
  }

  // Dark mode preference
  static bool get isDarkMode {
    _isDarkMode = _prefs.getBool('isDarkMode') ?? false;
    return _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  // Option theme preference
  static ThemeEnum get optionTheme {
    String? storedValue = _prefs.getString('optionTheme');
    _optionTheme = storedValue != null
        ? _stringToThemeEnum(storedValue)
        : ThemeEnum.system;
    return _optionTheme;
  }

  static set optionTheme(ThemeEnum value) {
    _optionTheme = value;
    _prefs.setString('optionTheme', value.name); // Guarda solo el nombre del enum
  }

  // Initialization of shared preferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Helper to convert String to ThemeEnum
  static ThemeEnum _stringToThemeEnum(String value) {
    return ThemeEnum.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ThemeEnum.system, // Valor predeterminado si no coincide
    );
  }
}
