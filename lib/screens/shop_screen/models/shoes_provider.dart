import 'package:flutter/material.dart';

import 'shoes.dart';

class ShoesProvider extends ChangeNotifier {
  Shoes? _itemShoes;
  int _indexSizeSelected = 0;

  Shoes? get itemShoes => _itemShoes;
  ShoesProvider(Shoes? itemShoes) {
    _itemShoes = itemShoes;
  }

  set itemShoes(Shoes? value) {
    _itemShoes = value;
    notifyListeners();
  }

  int get indexSizeSelected => _indexSizeSelected;
  set indexSizeSelected(int value) {
    _indexSizeSelected = value;
    notifyListeners();
  }
}
