import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
   
  const NotFoundScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(title: const Text('NotFoundScreen'),),
      body: const Center(
         child: Text('NotFoundScreen'),
      ),
    );
  }
}