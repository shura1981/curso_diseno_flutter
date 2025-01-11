 
import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  const ShakeTransition(
      {super.key,
      required this.child,
      this.duration = const Duration(milliseconds: 500),
      this.offset = 140.0,
      this.axis = Axis.horizontal});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      curve: Curves.elasticOut,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (BuildContext context, dynamic value, Widget? child) {
        return axis == Axis.horizontal
            ? Transform.translate(
                offset: Offset(value * offset, 0),
                child: child,
              )
            : Transform.translate(
                offset: Offset(0, value * offset),
                child: child,
              );
      },
      child: child,
    );
  }
}
