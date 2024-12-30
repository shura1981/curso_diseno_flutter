import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/audio_player_model.dart';

class ImagenDiscoDuracion extends StatelessWidget {
  const ImagenDiscoDuracion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ImagenDisco(),
          SizedBox(
            width: 10,
          ),
          _BarraProgreso(),
        ],
      ),
    );
  }
}

class _BarraProgreso extends StatelessWidget {
  const _BarraProgreso();

  final totalHeight = 230.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<AudioPlayerModel>(
          builder: (_, audioPlayerModel, __) {
            return Text(
              audioPlayerModel.songTotalDuration,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .color!
                    .withOpacity(0.4),
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Container(
              width: 3,
              height: totalHeight,
              color: const Color.fromARGB(255, 111, 111, 111).withOpacity(0.1),
            ),
            Consumer<AudioPlayerModel>(
                builder: (context, audioPlayerModel, __) {
              final porcentaje = audioPlayerModel.porcentaje;
              return Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: totalHeight * porcentaje,
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                ),
              );
            }),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Consumer<AudioPlayerModel>(builder: (_, audioPlayerModel, __) {
          return Text(
            audioPlayerModel.songCurrentDuration,
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .color!
                  .withOpacity(0.4),
            ),
          );
        }),
      ],
    );
  }
}

class _ImagenDisco extends StatelessWidget {
  const _ImagenDisco();

  @override
  Widget build(BuildContext context) {
    final audioProverModel = Provider.of<AudioPlayerModel>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(250),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff33333e),
            Color(0xff201e28),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(250),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              animate: audioProverModel.isPlaying,
              duration: const Duration(seconds: 10),
              infinite: true,
              controller: (animationController) =>
                  audioProverModel.initController(animationController),
              child: const Image(
                image: AssetImage('assets/img/player/aurora.jpg'),
              ),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black38,
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xff1C1C25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
