import 'package:flutter/material.dart';

class CurrentViewProvider extends ChangeNotifier {
  Widget? _currentView;

  set currentView(Widget? view) {
    _currentView = view;
    notifyListeners();
  }

  Widget? get currentView => _currentView;
}
