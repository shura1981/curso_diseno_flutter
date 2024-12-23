import 'package:flutter/material.dart';

mixin class ColorsTheme {
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

// color orange
  static Color themePrimaryCustom = const Color.fromARGB(255, 255, 87, 34);
  static Color themePrimaryColorCustomDark =
      const Color.fromARGB(255, 255, 87, 34);
  static Color themePrimaryColorCustom =
      const Color.fromARGB(255, 255, 87, 34);
  static Color themePrimaryColorCustomScheme =
      const Color.fromARGB(255, 255, 87, 34);
  static Color themeSecondaryColorCustomScheme =
      const Color.fromARGB(255, 255, 87, 34);
  static Color themeBackgroundScaffoldCustom =
      const Color.fromARGB(255, 255, 87, 34);


}