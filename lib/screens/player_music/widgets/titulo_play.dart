import 'package:flutter/material.dart';
import 'package:kplayer/kplayer.dart';

import 'package:provider/provider.dart';

import '../models/audio_player_model.dart';

class TituloPlay extends StatefulWidget {
  const TituloPlay({super.key});

  @override
  State<TituloPlay> createState() => _TituloPlayState();
}

class _TituloPlayState extends State<TituloPlay>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  AnimationController? controller;

  late PlayerController _audioPlayer;

  Future<void> _initializePlayer() async {
    try {
      // Cargar el archivo desde los assets
      _audioPlayer =
          Player.asset("assets/music/Breaking-Benjamin-Far-Away.mp3");
    } catch (e) {
      print("Error inicializando el audio: $e");
    }
  }

  void _listenToPosition() {
    final provider = Provider.of<AudioPlayerModel>(context, listen: false);
    _audioPlayer.streams.duration.listen((event) {
      provider.songDuration = event;
    });
    _audioPlayer.streams.position.listen((event) {
      provider.current = event;
    });
  }

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    // dispose all players
PlayerController.disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nombre de la canción',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Nombre del artista',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.4),
                    ),
              ),
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          FloatingActionButton(
            onPressed: () async {
              final provider =
                  Provider.of<AudioPlayerModel>(context, listen: false);

              provider.isPlayingChange();

              if (isPlaying) {
                controller!.reverse();
              } else {
                controller!.forward();
              }

              isPlaying = !isPlaying;

              if (!provider.isStart) {
                _initializePlayer();
                _listenToPosition();
                provider.isStart = true;
              }
              if (provider.isStart) _audioPlayer.toggle();
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: controller!,
            ),
          ),
        ],
      ),
    );
  }
}
