import 'package:flutter/material.dart';

class Shoes {
  String _name;
  String _description;
  double _price;
  List<double> _sizes;
  List<ColorShoes> _colors;

  get name => _name;

  get price => _price;

  set price(value) => _price = value;

  set name(value) => _name = value;

  get description => _description;

  set description(value) => _description = value;

  get sizes => _sizes;

  set sizes(value) => _sizes = value;

    List<ColorShoes> get images => _colors;

  set images(value) => _colors = value;

  Shoes(this._name, this._price, this._description, this._sizes, this._colors);
}

class ColorShoes {
  String _name;
  String _image;
  get name => _name;

  get image => _image;

  set name(value) => _name = value;

  set image(value) => _image = value;

  ColorShoes(this._name, this._image);
}

List<Shoes> shoes = [
  Shoes(
      'Nike Air Max 720',
      23.5,
      'The Nike Air Max 720 goes bigger than ever before with Nike\'s tallest Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.',
      [
        7,
        7.5,
        8,
        8.5,
        9,
        9.5
      ],
      [
        ColorShoes('azul', 'assets/img/shoes/azul.png'),
        ColorShoes('amarillo', 'assets/img/shoes/amarillo.png'),
        ColorShoes('negro', 'assets/img/shoes/negro.png'),
        ColorShoes('verde', 'assets/img/shoes/verde.png'),
      ]),
];

Color obtenerColor(String colorName) {
  Map<String, Color> colors = {
    'azul': Colors.blue,
    'amarillo': Colors.yellow,
    'negro': Colors.black,
    'verde': Colors.green
  };

  return colors[colorName] ?? Colors.blue;
}
