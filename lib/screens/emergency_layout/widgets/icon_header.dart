import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final Color colorFuente;
  final String title;
  final String subTitle;
  final Color degrant1;
  final Color degrant2;

  const IconHeader(
      {super.key,
      this.title = "Asistencia Médica",
      this.subTitle = "Haz solicitado",
      this.colorFuente  = Colors.white,
      this.degrant1 = const Color(0xff526BF6),
      this.degrant2 = const Color(0xff67ACF2)});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        _IconHeaderBackground(degrant1, degrant2),
        Positioned(
          top: -65,
          left: -65,
          child: FaIcon(FontAwesomeIcons.plus,
              size: 250, color: Colors.white.withOpacity(0.2)),
        ),
        Column(
          children: [
            const SizedBox(height: 80, width: double.infinity),
            Opacity(
              opacity: 0.7,
              child: Text(title, style: TextStyle(fontSize: 25, color: colorFuente))),
            Text(subTitle, style: TextStyle(fontSize: 30, color: colorFuente)),
            const SizedBox(height: 20),
            FaIcon(FontAwesomeIcons.plus, size: 40, color: colorFuente),
          ],
        ),
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color degrant1;
  final Color degrant2;
  const _IconHeaderBackground(this.degrant1, this.degrant2);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            degrant1,
           degrant2,
          ],
        ),
      ),
    );
  }
}
