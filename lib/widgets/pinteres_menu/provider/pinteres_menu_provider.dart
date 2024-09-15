

import 'package:flutter/material.dart';

class MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  Color backgroundColor= Colors.white;
  Color activeColor= Colors.black;
  Color inactiveColor= Colors.blueGrey;

  int get itemSeleccionado => _itemSeleccionado;

  set itemSeleccionado(int valor) {
    _itemSeleccionado = valor;
    notifyListeners();
  }
  
}