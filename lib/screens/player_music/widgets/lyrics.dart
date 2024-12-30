import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

class Lyrics extends StatelessWidget {
  const Lyrics({super.key});

  @override
  Widget build(BuildContext context) {
final lyrics= getLyrics();

    return ListWheelScrollView(
    physics: const BouncingScrollPhysics(),
    itemExtent: 42,
    diameterRatio: 1.5,
    children: lyrics.map((e) => Text(e, style: TextStyle(fontSize: 18, color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(.6)),)).toList(),
    );
  }
}