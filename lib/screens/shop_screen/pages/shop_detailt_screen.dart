import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shoes.dart';
import '../models/shoes_provider.dart';
import '../widgets/widgets.dart';

class ShopDetailtScreeen extends StatelessWidget {
  const ShopDetailtScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShoesProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'zapato-1',
                child: ZapatosSizePreview(
                  isFullScreen: true,
                ),
              ),
              Positioned(
                top: 40,
                child: IconButton(
                  iconSize: 40,
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ZapatoDescription(
                    title: provider.itemShoes!.name,
                    description: provider.itemShoes!.description,
                  ),
                  _MontoBuyNow(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: _ColoresYMas(),
                  ),
                  const _BotonsLikeCartSettings()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonsLikeCartSettings extends StatelessWidget {
  const _BotonsLikeCartSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(
            icon: Icons.star,
            onPressed: () {},
          ),
          _BotonSombreado(
            icon: Icons.add_shopping_cart,
            onPressed: () {},
          ),
          _BotonSombreado(
            icon: Icons.settings,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const _BotonSombreado({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: Colors.black,
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        children: [
          const Text(
            '\$180.0',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child:
                  BottonCard(text: 'Buy now', onPressed: () {}, isSmall: true)),
        ],
      ),
    );
  }
}

class _ColoresYMas extends StatelessWidget {
  const _ColoresYMas();
  @override
  Widget build(BuildContext context) {
    final colorsImages = Provider.of<ShoesProvider>(context).itemShoes!.images;
    return Row(
      children: [
          Expanded(
          child: SizedBox(
            height: 45,
            child: Stack(
              children: [
              for (var i = 0; i < colorsImages.length; i++)
                Positioned(
                  left: i * 30.0,
                  child: GestureDetector(
                    onTap: () {
                      final provider = Provider.of<ShoesProvider>(context, listen: false);
                      provider.indexSizeSelected= i;
                    },
                    child: _CircleColor(
                      color: obtenerColor(colorsImages[i].name),
                      index: i,
                    ),
                  ),
                ),
                // Positioned(left: 90, child: _CircleColor(color: Colors.red, index: 1)),
                // Positioned(left: 60, child: _CircleColor(color: Colors.blue, index: 2)),
                // Positioned(left: 30, child: _CircleColor(color: Colors.green, index: 3)),
              ],
            ),
          ),
        ),
        BottonCard(
          text: 'More related items',
          onPressed: () {},
          isSmall: true,
        ),
      ],
    );
  }
}

class _CircleColor extends StatelessWidget {
  final Color color;
  final int index;
  const _CircleColor({Key? key, required this.color, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
