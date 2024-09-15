import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../widgets/pinteres_menu/widget/pinteres_menu.dart';

class PinteresScreen extends StatelessWidget {
  const PinteresScreen({Key? key}) : super(key: key);

  static const nameRoute = '/pinteres';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _VisibleMenuProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PinteresScreen'),
        ),
        body: Stack(
          children: [const PinteresGrid(), _PinterestMenuBottom()],
        ),
      ),
    );
  }
}

class _PinterestMenuBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final anchoPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_VisibleMenuProvider>(context).isVisible;
    final menuItems = [
      PinterestButton(
          onPressed: () {
            print('Icon pie chart');
          },
          icon: Icons.pie_chart),
      PinterestButton(
          onPressed: () {
            print('Icon search');
          },
          icon: Icons.search),
      PinterestButton(
          onPressed: () {
            print('Icon notifications');
          },
          icon: Icons.notifications),
      PinterestButton(
          onPressed: () {
            print('Icon supervised_user_circle');
          },
          icon: Icons.supervised_user_circle),
    ];
    return Positioned(
        bottom: 30,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: mostrar ? 1 : 0,
          child: mostrar
              ? SizedBox(
                  width: anchoPantalla,
                  child: Align(
                      child: PinteresMenu(
                    menuItems: menuItems,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey,
                  )),
                )
              : const SizedBox(),
        ));
  }
}

class PinteresGrid extends StatefulWidget {
  const PinteresGrid({super.key});

  @override
  State<PinteresGrid> createState() => _PinteresGridState();
}

class _PinteresGridState extends State<PinteresGrid> {
  final List<int> items = List.generate(100, (index) => index);
  final scrollController = ScrollController();
  double scrollPreview = 0;

  @override
  void initState() {
    scrollController.addListener(() {
      final scroll = scrollController.offset;
      if (scroll > scrollPreview && scroll > 150) {
        Provider.of<_VisibleMenuProvider>(context, listen: false).ocultar();
      } else {
        Provider.of<_VisibleMenuProvider>(context, listen: false).mostrar();
      }
      scrollPreview = scroll;
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: scrollController,
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

class _VisibleMenuProvider with ChangeNotifier {
  bool isVisible = true;

  void mostrar() {
    isVisible = true;
    notifyListeners();
  }

  void ocultar() {
    isVisible = false;
    notifyListeners();
  }
}
