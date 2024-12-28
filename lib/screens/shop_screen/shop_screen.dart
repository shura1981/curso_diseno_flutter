import 'package:flutter/material.dart';

import 'shop_detailt_screen.dart';
import 'widgets/widgets.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);
  static const String nameRoute = '/shop_screen';

  @override
  Widget build(BuildContext context) {
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
                    const ZapatoDescription(
                      title: 'Nike Air Max 720',
                      description:
                          'The Nike Air Max 720 goes bigger than ever before with Nike\'s tallest Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.',
                    ),
                  ],
                ),
              ),
            ),
            const AgregarCarritoBoton(monto: 180.0)
          ],
        ),
      ),
    );
  }
}
