import 'package:flutter/material.dart';

class PageViewProvider extends ChangeNotifier {
  int _currentPage = 0;
  final _controller = PageController();

  int get currentPage => _currentPage;

  get controller => _controller;

  PageViewProvider() {
    _controller.addListener(() {
      _currentPage = _controller.page!.round();
      notifyListeners();
    });
  }

  void setCurrentPage(int page) {
    _currentPage = page;
    _controller.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    notifyListeners();
  }

  void reseCurentPage() {
    _currentPage = 0;
  }
}
