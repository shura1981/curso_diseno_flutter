import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/page_view_provider.dart';

class CustomSliderShow extends StatelessWidget {
  final List<Widget> slides;
  final Color? colorFocus;
  final Color? colorNoFocus;
  final double? sizeCurrent;
  final double? size;
  final bool? autoPlay;
  const CustomSliderShow(
      {super.key,
      required this.slides,
      this.colorFocus,
      this.colorNoFocus,
      this.sizeCurrent,
      this.autoPlay = true,
      this.size});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageViewProvider(), // Iniciar autoplay
      child: Builder(builder: (context) {
        final provider = Provider.of<PageViewProvider>(context, listen: false);

        if (colorFocus != null) {
          provider.setColorFocus(colorFocus!);
        }
        if (colorNoFocus != null) {
          provider.setColorNoFocus(colorNoFocus!);
        }
        if (sizeCurrent != null) {
          provider.setSizeCurrent(sizeCurrent!);
        }
        if (size != null) {
          provider.setSize(size!);
        }

        if (autoPlay == true) {
          provider.startAutoPlay();
        }

        provider.setTotalItems(slides.length);  // Agregar el total de items al provider

        return Center(
          child: Column(
            children: [
              Expanded(
                  child: _Slides(
                slides: slides,
              )),
              _Dots(
                count: slides.length,
                onDotTap: () {
                  provider
                      .stopAutoPlay(); // Detener autoplay cuando se toque un punto
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _Dots extends StatelessWidget {
  final int count;
  final VoidCallback onDotTap;

  const _Dots({required this.count, required this.onDotTap});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PageViewProvider>(context, listen: false);

    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < count; i++)
            GestureDetector(
              onTap: () {
                onDotTap(); // Llamamos a la función para detener el autoplay
                provider.setCurrentPage(i);
              },
              child: _Dot(i),
            ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PageViewProvider>(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: provider.getSize(index),
      height: provider.getSize(index),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: provider.getColor(index), shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatelessWidget {
  final List<Widget> slides;

  const _Slides({required this.slides});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PageViewProvider>(context, listen: false);
    return GestureDetector(
      onPanDown: (_) =>
          provider.stopAutoPlay(), // Detener autoplay al interactuar
      child: Container(
        padding: const EdgeInsets.all(10),
        child: PageView(
          controller: provider.controller,
          children: slides,
        ),
      ),
    );
  }
}
