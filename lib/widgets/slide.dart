import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Slide extends StatelessWidget {
  const Slide(this.svg, {super.key});

  final String svg;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}
