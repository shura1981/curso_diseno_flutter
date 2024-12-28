import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;
 const CustomAppBar(this.texto, {super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Text(
              texto,
              style:  const TextStyle(
                fontSize: 30, 
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.search,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
