import 'package:flutter/material.dart';

class BottonCard extends StatelessWidget {
  final String text;
  final bool isSmall;
  final void Function()? onPressed;
  const BottonCard(
      {Key? key, required this.text, required this.onPressed, this.isSmall = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding:  isSmall ? const EdgeInsets.symmetric(horizontal: 20, vertical: 5) : const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
