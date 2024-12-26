import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);
  static const String nameRoute = '/shop_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopScreen'),
      ),
      body: const Center(
        child: Text('ShopScreen'),
      ),
    );
  }
}
