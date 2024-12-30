import 'package:flutter/material.dart';

class AudioPlayerModel with ChangeNotifier {
  bool isPlaying = false;
  bool isStart = false;
  AnimationController? controller;

  Duration _songDuration = const Duration(milliseconds: 0);
  Duration _current = const Duration(milliseconds: 0);

  set songDuration(Duration duration) {
    _songDuration = duration;
    notifyListeners();
  }

  set current(Duration current) {
    _current = current;
    notifyListeners();
  }
 

  void isPlayingChange() {
    isPlaying = !isPlaying;
    if (isPlaying) {
      controller?.forward();
    } else {
      controller?.reverse();
    }
    notifyListeners();
  }

  void initController(AnimationController controller) {
    this.controller = controller;
  }

  void disposeController() {
    controller?.dispose();
  }

  double get porcentaje => _songDuration.inSeconds > 0
      ? _current.inSeconds / _songDuration.inSeconds
      : 0;

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  String get songTotalDuration => printDuration(_songDuration);
  String get songCurrentDuration => printDuration(_current);
}
