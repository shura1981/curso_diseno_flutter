import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/button_decorated.dart';
import 'widgets/icon_header.dart';

class EmergencyLayoutScreen extends StatelessWidget {
  static const nameRoute = '/emergency-layout';

  const EmergencyLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            icon: const Icon(FontAwesomeIcons.ellipsisVertical),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 280, bottom: 20),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ButtonDecorated(
                  icon: FontAwesomeIcons.carBurst,
                  text: 'Prueba 1',
                  onPressed: () => print('Prueba 1'),
                ),
                ButtonDecorated(
                  icon: FontAwesomeIcons.circle,
                  text: 'Prueba 2',
                  onPressed: () => print('Prueba 2'),
                ),
                ButtonDecorated(
                  icon: FontAwesomeIcons.coffee,
                  text: 'Prueba 3',
                  onPressed: () => print('Prueba 3'),
                ),
                ButtonDecorated(
                  icon: FontAwesomeIcons.cog,
                  text: 'Prueba 4',
                  onPressed: () => print('Prueba 4'),
                ),
              ],
            ),
          ),
          const IconHeader(),
        ],
      ),
    );
  }
}
