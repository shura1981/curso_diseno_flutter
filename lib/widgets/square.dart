import 'package:flutter/material.dart';

class SquareCenter extends StatelessWidget {
  const SquareCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      width: 100,
      height: 100,
      child: const Center(
        child: Text('1', style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    ));
  }
}
