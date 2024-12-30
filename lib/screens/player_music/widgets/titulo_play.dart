import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
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

  late AudioPlayer _audioPlayer;
  Duration? _duration;
  Duration _position = Duration.zero;
  Future<void> _initializePlayer() async {
    try {
      // Cargar el archivo desde los assets
  await _audioPlayer
      .setAsset('assets/music/Breaking-Benjamin-Far-Away.mp3').then((value) {
    // Obtener la duración del audio
    _duration = value;
    final provider = Provider.of<AudioPlayerModel>(context, listen: false);
    provider.songDuration = _duration!;
    setState(() {});
  });
   
    } catch (e) {
      print("Error inicializando el audio: $e");
    }
  }

  void _listenToPosition() {
     final provider = Provider.of<AudioPlayerModel>(context, listen: false);
    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _position = position;
        provider.current = _position;
      });
    });
  }

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _audioPlayer = AudioPlayer();

    _initializePlayer();
    _listenToPosition();

    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    _audioPlayer.dispose();
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
              isPlaying ? _audioPlayer.play() : _audioPlayer.stop();
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
