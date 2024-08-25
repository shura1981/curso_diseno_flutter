import 'package:flutter/material.dart';
import 'package:taller1/widgets/progress_circular.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

   static const nameRoute = '/animationProgress';

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  double porcentaje = 60;
  double porcentaje2 = 30;

// crear referencia al controlador del ProgressCircular usando el key
  final progressCircularKey = GlobalKey<ProgressCircularState>();
  final progressCircularKey2 = GlobalKey<ProgressCircularState>();


final Rect rect= Rect.fromCircle(center: const Offset(10,0), radius: 100);
final Gradient gradient = const LinearGradient(
  colors: [Color(0xffc012ff), Color(0xff6d05e8), Colors.red],
);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Circular Progress'),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              if (porcentaje >= 100) {
                porcentaje = 0;
                progressCircularKey.currentState!.reset();
                return;
              }
              if (porcentaje2 >= 100) {
                porcentaje2 = 0;
                progressCircularKey2.currentState!.reset();
                return;
              }

              porcentaje += 10;
              porcentaje2 += 10;

              setState(() {});
            }),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: 100,
                height: 100,
                child: ProgressCircular(
                  key: progressCircularKey,
                  porcentaje: porcentaje,
                  strokeFill: 6,
                  shader: gradient.createShader(rect),
                )),
            SizedBox(
                width: 100,
                height: 100,
                child: ProgressCircular(
                  key: progressCircularKey2,
                  porcentaje: porcentaje2,
                  colorFill: Colors.green,
                  strokeFill: 6,
                )),
          ],
        )));
  }
}
