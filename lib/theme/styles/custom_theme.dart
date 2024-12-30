import 'package:flutter/material.dart';

import 'card_custom_style.dart';
import 'colors_theme.dart';
import 'custom_colors.dart';

class CustomTheme {
  static ThemeData light = ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      CardCustomStyle(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        borderRadius: const Color.fromARGB(255, 42, 255, 4),
        color: ColorsTheme.themePrimaryColorLightDark,
      ),
      CustomColors(
        primaryColor: ColorsTheme.themePrimaryLight,
        accentColor: ColorsTheme.themeSecondaryColorLightScheme,
        secondaryColor: ColorsTheme.themePrimaryColorLightDark,
        customColorCard: ColorsTheme.themeCustomColorCard,
      ),
    ],
    primaryColor: ColorsTheme.themePrimaryLight,
    primaryColorDark: ColorsTheme.themePrimaryColorLightDark,
    colorScheme: ColorScheme.light(
      primary: ColorsTheme.themePrimaryColorLightScheme,
      secondary: ColorsTheme.themeSecondaryColorLightScheme,
    ),
    primaryColorLight: ColorsTheme.themePrimaryColorLight,
    canvasColor: Colors.grey[300],
    brightness: Brightness.light,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorsTheme.themePrimaryLight,
      unselectedItemColor: const Color.fromARGB(255, 69, 69, 69),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsTheme.themePrimaryColorLightDark,
        foregroundColor: Colors.white),
    dividerTheme: const DividerThemeData(
      color: Color.fromARGB(95, 57, 156, 255),
      thickness: 1,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black87),
      bodyLarge: TextStyle(color: Colors.black87),
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      displaySmall: TextStyle(fontSize: 14, color: Colors.black87),
    ),
  );

  static ThemeData dark = ThemeData.dark().copyWith(
      extensions: <ThemeExtension<dynamic>>[
        CardCustomStyle(
          backgroundColor: const Color.fromARGB(255, 61, 61, 61),
          borderRadius: const Color.fromARGB(255, 29, 29, 29),
          color: ColorsTheme.themePrimaryColorDark,
        ),
        CustomColors(
          primaryColor: ColorsTheme.themePrimaryDark,
          accentColor: ColorsTheme.themePrimaryLight,
          secondaryColor: ColorsTheme.themePrimaryColorDark,
          customColorCard: ColorsTheme.themeCustomColorCardDark,
        ),
      ],
      primaryColor: ColorsTheme.themePrimaryDark,
      primaryColorDark: ColorsTheme.themePrimaryColorDark,
      primaryColorLight: ColorsTheme.themePrimaryColorLight,
      colorScheme: ColorScheme.dark(
        primary: ColorsTheme.themePrimaryColorDarkScheme,
        secondary: ColorsTheme.themeSecondaryColorDarkScheme,
      ),
      canvasColor: const Color.fromARGB(255, 26, 26, 26),
      brightness: Brightness.dark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: ColorsTheme.themePrimaryDark,
        unselectedItemColor: Colors.white,
      ),
      scaffoldBackgroundColor: ColorsTheme.themeBackgroundScaffold,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorsTheme.themePrimaryColorDark,
          foregroundColor: Colors.white),
      dividerTheme: const DividerThemeData(
        color: Color.fromARGB(96, 255, 36, 226),
        thickness: 1,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 63, 63, 63),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        displaySmall:
            TextStyle(fontSize: 14, color: Color.fromARGB(221, 255, 255, 255)),
      ));

  // Obtener un tema personalizado basado en el brillo del sistema
  static ThemeData getCustom(Brightness brightness) {
    // Detectar si el sistema está en modo oscuro
    final baseTheme = brightness == Brightness.dark ? dark : light;
    // Modificar solo los colores primarios y secundarios
    return baseTheme.copyWith(
      extensions: <ThemeExtension<dynamic>>[
        CardCustomStyle(
          backgroundColor: const Color.fromARGB(255, 61, 61, 61),
          borderRadius: const Color.fromARGB(255, 29, 29, 29),
          color: ColorsTheme.themePrimaryCustom,
        ),
        CustomColors(
          primaryColor: ColorsTheme.themePrimaryCustom,
          accentColor: ColorsTheme.themeSecondaryColorCustomScheme,
          secondaryColor: ColorsTheme.themeSecondaryColorCustomScheme,
          customColorCard: ColorsTheme.themeCustomColorCardCustom,
        ),
      ],
      primaryColor: ColorsTheme.themePrimaryColorCustomDark,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: ColorsTheme.themeSecondaryColorCustomScheme,
        secondary: ColorsTheme.themeSecondaryColorDarkScheme,
      ),
      dividerTheme: baseTheme.dividerTheme.copyWith(
        color: ColorsTheme.themePrimaryColorCustomDark,
      ),
    );
  }
}
