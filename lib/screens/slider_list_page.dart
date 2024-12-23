import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/styles/custom_colors.dart';

class SliderListScreen extends StatelessWidget {
  static const String nameRoute = '/slider_list';

  const SliderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderListProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Stack(
              children: [
                _MainScroll(),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Consumer<_SliderListProvider>(
                    builder: (context, provider, child) {
                      print('provider.showElevated: ${provider.showElevated}');
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: provider.showElevated
                              ? const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ]
                              : [],
                        ),
                        child: IconButton(
                            color: const Color.fromARGB(255, 24, 24, 24),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                      );
                    }
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: _BotonNewList(),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

class _SliderListProvider extends ChangeNotifier {
  bool _showElevated = false;
  bool get showElevated => _showElevated;

  set showElevated(bool value) {
    _showElevated = value;
    notifyListeners();
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 150,
      height: 200,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffED6762),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
          ),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text("Crear nueva tarea",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 3)),
                Icon(
                  Icons.add,
                  size: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        });
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: const Text(
            'Título',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Positioned(
                bottom: 8,
                child: Container(
                    width: 150, height: 8, color: const Color(0xffF7CDD5))),
            const Text(
              'Lista de tareas',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  final int index;
  final Color color;
  final String titulo;
  const _ListItem(
    this.titulo,
    this.color, {
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      child: Text(
        titulo,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _MainScroll extends StatefulWidget {
  @override
  State<_MainScroll> createState() => _MainScrollState();
}

class _MainScrollState extends State<_MainScroll> {
  final items = [
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
    const _ListItem('Orange', Color(0xffF08F66)),
    const _ListItem('Family', Color(0xffF2A38A)),
    const _ListItem('Subscriptions', Color(0xffF7CDD5)),
    const _ListItem('Books', Color(0xffFCEBAF)),
  ];

  late ScrollController? _controller;

  @override
  void initState() {
    // TODO: implement initState
   // Ejecutar después de que el widget esté completamente montado
   super.initState();
    _controller = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<_SliderListProvider>(context, listen: false);
      _controller?.addListener(() {
        final offset = _controller!.offset;
        if (offset > 150) {
          provider.showElevated = true;
        } else {
          provider.showElevated = false;
        }
      });
    });

  }

  @override
  Widget build(BuildContext context) {
        CustomColors cardCustomStyle =
        Theme.of(context).extension<CustomColors>()!;
    return CustomScrollView(
      controller: _controller,
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: _Titulo(),
        // ),
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
              minHeight: 170,
              maxHeight: 200,
              child: Container(
                  color: cardCustomStyle.primaryColor,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: FittedBox(child: _Titulo())),
            )),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            // silver padding
            const SizedBox(height: 100),
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    // Comparamos explícitamente las propiedades de esta clase
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
