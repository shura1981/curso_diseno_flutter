import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shoes_provider.dart';
import '../widgets/widgets.dart';
import 'shop_detailt_screen.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);
  static const String nameRoute = '/shop_screen';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShoesProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back)),
                  const Expanded(
                    child: CustomAppBar('For you'),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          final route = MaterialPageRoute(
                              builder: (context) => const ShopDetailtScreeen());
                          Navigator.push(context, route);
                        },
                        child: const Hero(
                            tag: 'zapato-1',
                            child: Material(child: ZapatosSizePreview()))),
                    ZapatoDescription(
                      title: provider.itemShoes!.name,
                      description: provider.itemShoes!.description,
                    ),
                  ],
                ),
              ),
            ),
            AgregarCarritoBoton(monto: provider.itemShoes!.price),
          ],
        ),
      ),
    );
  }
}
