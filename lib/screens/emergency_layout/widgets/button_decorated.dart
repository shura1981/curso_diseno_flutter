import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonDecorated extends StatelessWidget {
  const ButtonDecorated({
    Key? key,
    required this.icon,
    required this.text,
    this.color1 = const Color(0xff526BF6),
    this.color2 = const Color(0xff67ACF2),
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: _boxDecoration(color1, color2),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onPressed(),
            child: Stack(
              children: [
                _Background(
                  icon: icon,
                ),
                _Body(icon: icon, text: text)
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration(Color color1, Color color2) {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          offset: const Offset(4, 6),
        ),
      ],
      gradient: LinearGradient(
        colors: [color1, color2],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final IconData icon;
  final String text;
  const _Body({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, size: 40, color: Colors.white),
            const SizedBox(width: 20),
            Expanded(
              child: Text(text,
                  style: const TextStyle(fontSize: 15, color: Colors.white)),
            ),
            const SizedBox(width: 20),
            const FaIcon(FontAwesomeIcons.chevronRight,
                size: 40, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final IconData icon;
  const _Background({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -20,
      right: -20,
      child: FaIcon(
        icon,
        size: 150,
        color: Colors.white.withOpacity(0.2),
      ),
    );
  }
}
