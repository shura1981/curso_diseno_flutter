

import 'package:flutter/material.dart';

class MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int valor) {
    _itemSeleccionado = valor;
    notifyListeners();
  }
}