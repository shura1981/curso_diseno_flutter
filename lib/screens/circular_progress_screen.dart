import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      color: Colors.red,
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: _MiRadialProgress(),
      ),
    )));
  }
}

class _MiRadialProgress extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint()
      ..strokeWidth = 10
      ..color = const Color.fromARGB(255, 11, 196, 79)
      ..style = PaintingStyle.stroke;
    double width = size.width * 0.5;
    double height = size.height * 0.5;

    final center = Offset(width, height);
    double radius = min(width, height);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
