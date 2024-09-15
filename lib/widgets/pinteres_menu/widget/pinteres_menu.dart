import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller1/widgets/pinteres_menu/provider/pinteres_menu_provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinteresMenu extends StatelessWidget {
  final List<PinterestButton> menuItems;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  const PinteresMenu(
      {super.key,
      required this.menuItems,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuModel(),
      child: Builder(builder: (context) {
        final provider = Provider.of<MenuModel>(context);
        provider.backgroundColor = backgroundColor;
        provider.activeColor = activeColor;
        provider.inactiveColor = inactiveColor;
        return _PinterestMenuBackground(
          _MenuItems(menuItems),
        );
      }),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  const _PinterestMenuBackground(this.child);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Provider.of<MenuModel>(context).backgroundColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          )
        ],
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems(this.menuItems);

  final List<PinterestButton> menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length,
          (index) => _PinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuModel>(context);

    return GestureDetector(
      onTap: () {
        provider.itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: (provider.itemSeleccionado == index) ? 30 : 25,
        color: (provider.itemSeleccionado == index)
            ? Provider.of<MenuModel>(context).activeColor
            : Provider.of<MenuModel>(context).inactiveColor,
      ),
    );
  }
}
