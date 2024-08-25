import 'dart:math';
import 'package:flutter/material.dart';

class ProgressCircular extends StatefulWidget {
  const ProgressCircular({
    super.key,
    required this.porcentaje,
    this.colorFill = Colors.pink,
    this.colorStroke = const Color.fromARGB(255, 175, 175, 175),
    this.strokeFill = 8.0,
    this.strokeWidth = 4.0,
    this.shader,
  });

  final double porcentajeLimite = 100;
  final double porcentaje;
  final Color colorFill;
  final Color colorStroke;
  final double strokeWidth;
  final double strokeFill;
  final Shader? shader;

  @override
  State<ProgressCircular> createState() => ProgressCircularState();
}

class ProgressCircularState extends State<ProgressCircular>
    with SingleTickerProviderStateMixin {
  final _size = double.infinity;
  double porcentajeAnterior = 0;
  late final AnimationController _controllerAnimation;

  void reset() {
    porcentajeAnterior = 0;
  }

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    _controllerAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    _controllerAnimation.dispose();
    super.dispose();
  }

  String obtenerPorcentaje(double porcentaje) {
    if (porcentaje > 100) {
      return '100%';
    }
    return '${porcentaje.toInt()}%';
  }

  @override
  Widget build(BuildContext context) {
    _controllerAnimation.forward(from: 0.0);

    final diferenciaAnimacion = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: _controllerAnimation,
        builder: (context, child) {
          final valor = (widget.porcentaje - diferenciaAnimacion) +
              (diferenciaAnimacion * _controllerAnimation.value);

          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: _size,
                height: _size,
                child: CustomPaint(
                  painter: _MiRadialProgress(valor,
                      colorFill: widget.colorFill,
                      colorStroke: widget.colorStroke,
                      strokeWidth: widget.strokeWidth,
                      shader: widget.shader,
                      strokeFill: widget.strokeFill),
                ),
              ),
              Container(
                width: _size,
                height: _size,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    obtenerPorcentaje(valor),
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class _MiRadialProgress extends CustomPainter {
  double porcentaje;
  Color colorFill;
  Color colorStroke;
  double strokeWidth;
  final double strokeFill;
  Shader? shader;

  _MiRadialProgress(this.porcentaje,
      {required this.colorFill,
      required this.strokeWidth,
      required this.strokeFill,
      this.shader,
      required this.colorStroke});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 4
      ..color = colorStroke
      ..style = PaintingStyle.stroke;
    double width = size.width * 0.5;
    double height = size.height * 0.5;

    final center = Offset(width, height);
    double radius = min(width, height);

    canvas.drawCircle(center, radius, paint);

    final paintArco = Paint()
      ..strokeWidth = strokeFill
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    if (shader == null) {
      paintArco.color = colorFill;
    } else {
      paintArco.shader = shader;
    }

    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
