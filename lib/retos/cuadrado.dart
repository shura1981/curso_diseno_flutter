import 'package:flutter/material.dart';
import 'package:taller1/widgets/square.dart';

class CuadradoAnimadoPage extends StatefulWidget {
  const CuadradoAnimadoPage({super.key});

  @override
  State<CuadradoAnimadoPage> createState() => _CuadradoAnimadoPageState();
}

class _CuadradoAnimadoPageState extends State<CuadradoAnimadoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _moveRight;
  late Animation<double> _moveLeft;
  late Animation<double> _moveUp;
  late Animation<double> _moveDown;
  late Animation<double> _fadeOut;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4500))
      ..addListener(() {});

    _moveRight = Tween<double>(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.25, curve: Curves.bounceOut)));

    _moveUp = Tween<double>(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)));

    _moveLeft = Tween<double>(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)));

    _moveDown = Tween<double>(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));

    _fadeOut = Tween<double>(begin: 1.0, end: 0.5).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.50, curve: Curves.easeOut)));

    _fadeIn = Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.50, 1.0, curve: Curves.easeOut)));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          builder: (context, childSquare) {
            final opacity = _controller.value <= 0.5
                ? _fadeOut.value
                : _fadeIn.value;

            return Transform.translate(
                offset: Offset(_moveRight.value + _moveLeft.value,
                    _moveUp.value + _moveDown.value),
                child: Opacity(opacity: opacity, child: childSquare));
          },
          animation: _controller,
          child: const SquareCenter(),
        ),
      ),
    );
  }
}
