// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../theme/styles/custom_colors.dart';
 
import 'widgets.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;
  const AgregarCarritoBoton({
    Key? key,
    required this.monto,
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).extension<CustomColors>()!.customColorCard.withOpacity(.8),
          borderRadius:  BorderRadius.circular(100),
          //añadir blur y opacidad
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 5),
              blurRadius: 5,
            ),
          ],

        ),
        child: Row(
          children: [
              const SizedBox(width: 10,),
             Expanded(
              child: Text(
                '\$$monto',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
             BottonCard(text:'Add to cart', onPressed: () {
        
            },),
          ],
        ),
      ),
    );
  }
}

