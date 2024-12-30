import 'package:flutter/material.dart';

enum TypeAnimation {
  slide('slide'),
  fade('fade'),
  scale('scale'),
  rotation('rotation'),
  translate('translate');

  const TypeAnimation(this.typeAnimation);
  final String typeAnimation;
}

Animation<double> getAnimage(Animation<double> animation) {
  return Tween<double>(begin: 0, end: 1).animate(animation);
}

Route crearRuta(Widget screenDestiny,
    [TypeAnimation typeAnimation = TypeAnimation.slide]) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screenDestiny,
    // transitionDuration: const Duration(seconds: 2),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, -1.0);
      var end = Offset.zero;
      var curve = Curves.easeInOut;

      final curveAnimation = CurvedAnimation(parent: animation, curve: curve);

      switch (typeAnimation) {
        case TypeAnimation.fade:
          return FadeTransition(
            opacity: getAnimage(curveAnimation),
            child: child,
          );
        case TypeAnimation.scale:
          return ScaleTransition(
            scale: getAnimage(curveAnimation),
            child: child,
          );
        case TypeAnimation.rotation:
          return RotationTransition(
            turns: getAnimage(curveAnimation),
            child: child,
          );
        default:
          final tweenAnimation =
              Tween<Offset>(begin: begin, end: end).animate(curveAnimation);
          return SlideTransition(
            position: tweenAnimation,
            child: child,
          );
      }
    },
  );
}

class ChangeScreenAnimationScreen extends StatelessWidget {
  const ChangeScreenAnimationScreen({Key? key}) : super(key: key);
  static const nameRoute = '/change-screen-animation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeScreenAnimationScreen'),
      ),
      body: const Center(
        child: Text('ChangeScreenAnimationScreen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, crearRuta(const PageOne(), TypeAnimation.fade ));
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

// crear tres rutas con navbar

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageOne'),
      ),
      body: const Center(
        child: Text('PageOne'),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageTwo'),
      ),
      body: const Center(
        child: Text('PageTwo'),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageThree'),
      ),
      body: const Center(
        child: Text('PageThree'),
      ),
    );
  }
}
