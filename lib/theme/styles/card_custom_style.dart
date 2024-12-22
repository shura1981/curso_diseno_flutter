import 'package:flutter/material.dart';

class CardCustomStyle extends ThemeExtension<CardCustomStyle> {
  final Color backgroundColor;
  final Color borderRadius;
  final Color color;

  CardCustomStyle({required this.backgroundColor, required this.borderRadius, required this.color});

  @override
  ThemeExtension<CardCustomStyle> copyWith(
          {Color? backgroundColor, Color? borderRadius, Color? color}) =>
      CardCustomStyle(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        borderRadius: borderRadius ?? this.borderRadius,
        color: color ?? this.color,
      );
  @override
  ThemeExtension<CardCustomStyle> lerp(
      covariant ThemeExtension<CardCustomStyle>? other, double t) {
    if (other is! CardCustomStyle) return this;
    return CardCustomStyle(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderRadius: Color.lerp(borderRadius, other.borderRadius, t)!,
      color: Color.lerp(color, other.color, t)!,
    );
  }
}
