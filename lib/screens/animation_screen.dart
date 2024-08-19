import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:taller1/widgets/square.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animationOpacity;
  late Animation<double> _animationOpacityFadeOut;
  late Animation<double> _animationMovieRight;
  late Animation<double> _animationScale;

  int _counter = 0;

  @override
  void initState() {
    
    _controller = AnimationController(
        duration: const Duration(milliseconds: 4000), vsync: this)
      ..addListener(() {
        if (_controller.status == AnimationStatus.completed) {
          _counter++;
          _controller.reverse();
        }
        // if(_counter == 3) {
        //   _controller.stop();
        // }
      });

    _animation = Tween<double>(begin: 0.0, end: 2 * math.pi)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _animationOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0, 0.25, curve: Curves.easeOut)));

   _animationOpacityFadeOut = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));

    _animationMovieRight = Tween<double>(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

_animationScale=  Tween<double>(begin: 1.0, end: 2.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));


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
        body: AnimatedBuilder(
            animation: _animation,
            builder: (context, childRectangle) {
              return Transform.translate(
                offset: Offset(_animationMovieRight.value, 0),
                child: Transform.rotate(
                    angle: _animation.value,
                    child: Opacity(
                        opacity: _animationOpacity.value -  _animationOpacityFadeOut.value, child: Transform.scale(
                          scale: _animationScale.value,
                          child: childRectangle))),
              );
            },
            child: const  SquareCenter()));
  }
}

