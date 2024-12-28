import 'package:flutter/material.dart';
import 'package:taller1/helpers/constants.dart' show sizeMobile, sizeTablet;

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < sizeMobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < sizeTablet &&
      MediaQuery.of(context).size.width >= sizeMobile;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= sizeTablet;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print(size.width);
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= sizeTablet) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (size.width >= sizeMobile && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
