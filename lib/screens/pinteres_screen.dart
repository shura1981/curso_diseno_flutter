import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/pinteres_menu/widget/pinteres_menu.dart';

class PinteresScreen extends StatelessWidget {
  const PinteresScreen({Key? key}) : super(key: key);

  static const nameRoute = '/pinteres';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PinteresScreen'),
      ),
      body: Stack(
        children: [PinteresGrid(), _PinterestMenuBottom()],
      ),
    );
  }
}

class _PinterestMenuBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final anchoPantalla = MediaQuery.of(context).size.width;
    return Positioned(
        bottom: 30,
        child: SizedBox(
          width: anchoPantalla,
          child: Align(child: PinteresMenu()),
        ));
  }
}

class PinteresGrid extends StatelessWidget {
  PinteresGrid({super.key});

  final List<int> items = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinteresItem(
        index: index,
      ),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinteresItem extends StatelessWidget {
  const _PinteresItem({
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ));
  }
}
