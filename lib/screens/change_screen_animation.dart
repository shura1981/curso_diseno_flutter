import 'package:flutter/material.dart';
import 'package:kplayer/kplayer.dart';

class ChangeScreenAnimationScreen extends StatelessWidget {
   
  const ChangeScreenAnimationScreen({Key? key}) : super(key: key);
     static const nameRoute = '/change-screen-animation';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(title: const Text('ChangeScreenAnimationScreen'),),
      body: const Center(
         child: Text('ChangeScreenAnimationScreen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         var player = Player.asset("assets/music/Breaking-Benjamin-Far-Away.mp3");
         player.play();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}