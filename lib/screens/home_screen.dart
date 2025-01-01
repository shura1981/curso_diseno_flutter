import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/responsive.dart';
import '../provider/current_view_provider.dart';
import '../widgets/menu_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const nameRoute = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerViewCurrent = Provider.of<CurrentViewProvider>(context);

    return Responsive(
      mobile: const _MobileScreen(),
      tablet: _TabletScreen(providerViewCurrent: providerViewCurrent),
      desktop: _DesktopScreen(providerViewCurrent: providerViewCurrent),
    );
  }
}

class _DesktopScreen extends StatelessWidget {
  const _DesktopScreen({
    required this.providerViewCurrent,
  });

  final CurrentViewProvider providerViewCurrent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 290, maxWidth: 290),
              child: const MenuDrawer()),
          Container(
              width: 1,
              height: double.infinity,
              color: Theme.of(context).primaryColor),
          Expanded(
            child: providerViewCurrent.currentView ??
                const _HomeContainerScreen(),
          ),
        ],
      ),
    );
  }
}

class _TabletScreen extends StatelessWidget {
  const _TabletScreen({
    required this.providerViewCurrent,
  });

  final CurrentViewProvider providerViewCurrent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 270, maxWidth: 270),
              child: const MenuDrawer()),
          Container(
              width: 1,
              height: double.infinity,
              color: Theme.of(context).primaryColor),
          Expanded(
            child: providerViewCurrent.currentView ??
                const _HomeContainerScreen(),
          ),
        ],
      ),
    );
  }
}

class _HomeContainerScreen extends StatelessWidget {
  const _HomeContainerScreen();

  @override
  Widget build(BuildContext context) {
    return Center(child: FilledButton.tonal(onPressed: (){

    }, child: const Text('Home')));
  }
}

class _MobileScreen extends StatelessWidget {
  const _MobileScreen();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: Text(
          'Inicio',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: const _HomeContainerScreen(),
    );
  }
}
