import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color primaryColor;
  final Color accentColor;
  final Color secondaryColor;

  CustomColors(
      {required this.primaryColor,
      required this.accentColor,
      required this.secondaryColor});

  @override
  ThemeExtension<CustomColors> copyWith(
          {Color? primaryColor, Color? accentColor, Color? secondaryColor}) =>
      CustomColors(
        primaryColor: primaryColor ?? this.primaryColor,
        accentColor: accentColor ?? this.accentColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
      );
  @override
  ThemeExtension<CustomColors> lerp(
      covariant ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
    );
  }
}
