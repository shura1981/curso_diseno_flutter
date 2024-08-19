import 'package:flutter/material.dart';

class HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke
    lapiz.strokeWidth = 5;

    final path = Path();
    path.lineTo(0, size.height * .35);
    path.lineTo(size.width, size.height * .30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderTriangulo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke
    lapiz.strokeWidth = 5;

    final path = Path();
    // option 1
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

// option 2
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderConPico extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke
    lapiz.strokeWidth = 5;

    final altoCentral = size.height * .30;
    final altoLaterales = size.height * .25;
    final centro = size.width * .5;

    final path = Path();
    // option 1
    path.lineTo(0, altoLaterales);
    path.lineTo(centro, altoCentral);
    path.lineTo(size.width, altoLaterales);
    path.lineTo(size.width, 0);

// option 2
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke
    lapiz.strokeWidth = 5;

    final altoCentral = size.height * .40; //curva hacia arriba
// final altoCentral= size.height * .20; // curva hacia arriba
    final altoLaterales = size.height * .25;
    final centro = size.width * .5;

    final path = Path();
    // option 1
    path.lineTo(0, altoLaterales);
    path.quadraticBezierTo(centro, altoCentral, size.width, altoLaterales);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderWaves extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke
    lapiz.strokeWidth = 5;

    final altoLaterales = size.height * .25;
    final altoCentralUno = size.height *
        .30; //si se quiere aumentar la curva aumentar el valor y disminuir el valor de altoCentralDos restando la misma cantidad
    final altoCentralDos = size.height * .20;
    final unCuarto = size.width * .25;

    final path = Path();
    // option 1
    path.lineTo(0, altoLaterales);
    path.quadraticBezierTo(
        unCuarto, altoCentralUno, unCuarto * 2, altoLaterales);

    path.quadraticBezierTo(
        unCuarto * 3, altoCentralDos, size.width, altoLaterales);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: const Offset(165.0, 55.0),
      radius: 180,
    );

    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      stops: <double>[
        0.0,
        0.5,
        1.0,
      ],
    );




    final lapiz = Paint()..shader = gradient.createShader(rect);
    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // .stroke
    lapiz.strokeWidth = 5;

    final altoLaterales = size.height * .25;
    final altoCentralUno = size.height *
        .30; //si se quiere aumentar la curva aumentar el valor y disminuir el valor de altoCentralDos restando la misma cantidad
    final altoCentralDos = size.height * .20;
    final unCuarto = size.width * .25;

    final path = Path();
    // option 1
    path.lineTo(0, altoLaterales);
    path.quadraticBezierTo(
        unCuarto, altoCentralUno, unCuarto * 2, altoLaterales);

    path.quadraticBezierTo(
        unCuarto * 3, altoCentralDos, size.width, altoLaterales);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}
