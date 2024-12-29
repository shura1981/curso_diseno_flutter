import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shoes_provider.dart';

class ZapatosSizePreview extends StatelessWidget {
  final bool isFullScreen;
  const ZapatosSizePreview({super.key, this.isFullScreen = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(!isFullScreen ? 30 : 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffF8D468),
          borderRadius: !isFullScreen
              ? const BorderRadius.all(Radius.circular(50))
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const _ZapatoConSombra(),
              if (!isFullScreen)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: _ZapatoTallas(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShoesProvider>(context);
    int indexSizeSelected = provider.indexSizeSelected;
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Image(image: AssetImage(provider.itemShoes!.images[indexSizeSelected].image)),
        ],
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShoesProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => _SelectButtonProvider(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          children: [
            for (var i = 0; i < provider.itemShoes!.sizes.length; i++)
              _TallaZapatoCaja(provider.itemShoes!.sizes[i], (i + 1)),
          ],
        ),
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double numero;
  final int index;
  const _TallaZapatoCaja(this.numero, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      onTap: () {
        final provider =
            Provider.of<_SelectButtonProvider>(context, listen: false);
        provider.selected = index;
      },
      child: Consumer<_SelectButtonProvider>(builder: (context, itemSelect, _) {
        return Container(
          alignment: Alignment.center,
          width: 45,
          height: 45,
          decoration: itemSelect.selected == index
              ? BoxDecoration(
                  color: const Color(0xffF1A23A),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffF1A23A),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                )
              : BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
          child: Text(
            numero.toString().replaceAll('.0', ''),
            style: TextStyle(
              color: itemSelect.selected == index ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }),
    );
  }
}

class _SelectButtonProvider extends ChangeNotifier {
  int _selected = 0;

  int get selected => _selected;

  set selected(int value) {
    _selected = value;
    notifyListeners();
  }
}
