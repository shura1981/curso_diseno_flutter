import 'dart:async';
import 'package:flutter/material.dart';

class PageViewProvider extends ChangeNotifier {
  PageViewProvider() {
    initController();
  }

  int _currentPage = 0;
  PageController? _controller;
  Color _colorFocus = Colors.blue;
  Color _colorNoFocus = Colors.grey;
  double _sizeCurrent = 12.0;
  double _size = 10.0;
  Timer? _timer; // Timer para controlar el autoplay
  bool _autoplayEnabled = true; // Bandera para controlar si el autoplay está habilitado
  int _totalItems=0; // Total de items en el PageView
  int get currentPage => _currentPage;
  PageController? get controller => _controller;
  bool get autoplayEnabled => _autoplayEnabled;

  Color getColor(int index) {
    return index == _currentPage ? _colorFocus : _colorNoFocus;
  }

  void setSizeCurrent(double size) {
    _sizeCurrent = size;
  }

void setTotalItems(int totalItems) {
    _totalItems = totalItems-1;
  }

  void setSize(double size) {
    _size = size;
  }

  double getSize(int index) {
    return index == _currentPage ? _sizeCurrent : _size;
  }

  void setColorFocus(Color color) {
    _colorFocus = color;
  }

  void setColorNoFocus(Color color) {
    _colorNoFocus = color;
  }

  initController() {
    _controller = PageController();
    _controller!.addListener(() {
      _currentPage = _controller!.page!.round();
      notifyListeners();
    });
  }

  void disposeController() {
    _currentPage = 0;
    _controller!.dispose();
  }

  void setCurrentPage(int page) {
    _currentPage = page;
    _controller!.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    notifyListeners();
  }

  void nextCurrentPage() {
    if (_currentPage < _totalItems) {
      _currentPage++;
      _controller!.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      notifyListeners();
    }
  }

  void resetCurrentPage() {
    _currentPage = 0;
    _controller!.jumpToPage(0);
    notifyListeners();
  }

  // Métodos para manejar el autoplay
  void startAutoPlay() {
    if (_autoplayEnabled && _timer == null) {
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        if (_currentPage < _totalItems) {
          nextCurrentPage();
        } else {
          resetCurrentPage();
        }
      });
    }
  }

  void stopAutoPlay() {
    _timer?.cancel();
    _timer = null;
  }

  void toggleAutoPlay(bool enable) {
    _autoplayEnabled = enable;
    if (_autoplayEnabled) {
      startAutoPlay();
    } else {
      stopAutoPlay();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    stopAutoPlay();
    super.dispose();
  }
}
