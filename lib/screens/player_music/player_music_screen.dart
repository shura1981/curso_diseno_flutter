import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/audio_player_model.dart';
import 'widgets/widgets.dart';

class PlayerMuiscScreen extends StatelessWidget {
  static const String nameRoute = '/player-music';
  const PlayerMuiscScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      top: true,
      child: ChangeNotifierProvider(
        create: (_) => AudioPlayerModel(),
        child: const _StackPlayer(),
      ),
    ));
  }
}

class _StackPlayer extends StatelessWidget {
  const _StackPlayer();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _Background(),
        Column(
          children: [
            CustomAppBar(),
            ImagenDiscoDuracion(),
            TituloPlay(),
            Expanded(child: Lyrics()),
          ],
        ),
      ],
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.8,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            Color(0xff33333E),
            Color(0xff201E28),
          ],
        ),
      ),
    );
  }
}
