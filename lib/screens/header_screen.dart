import 'package:flutter/material.dart';
import 'package:taller1/widgets/widgets.dart';



class HeaderScreen extends StatelessWidget {
  const HeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //  backgroundColor: const Color(0xff615AAB),
      appBar: AppBar(
        title: const Text('CustomPaintScreen'),
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: HeaderGradient(),
        ),
      ),
    );
  }
}

