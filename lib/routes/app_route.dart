import 'package:flutter/material.dart';
import 'package:taller1/screens/screens.dart';

import '../retos/cuadrado.dart';
import '../models/menu_router.dart';

class AppRoute {
  static const initialRoute = '/';
  static final menuOptions = <MenuRouter>[
    MenuRouter(
        route: AnimationScreen.nameRoute,
        icon: Icons.circle,
        name: 'Animación 1',
        screen: const AnimationScreen()),
    MenuRouter(
        route: CircularProgressPage.nameRoute,
        icon: Icons.chat_rounded,
        name: 'Animación 2',
        screen: const CircularProgressPage()),
    MenuRouter(
        route: HeaderScreen.nameRoute,
        icon: Icons.hail_outlined,
        name: 'Animación 3',
        screen: const HeaderScreen()),
    MenuRouter(
        route: CuadradoAnimadoPage.nameRoute,
        icon: Icons.handshake,
        name: 'Animación 4',
        screen: const CuadradoAnimadoPage()),
    MenuRouter(
        route: SliderShowScreen.nameRoute,
        icon: Icons.slideshow,
        name: 'SliderShowScreen',
        screen: const SliderShowScreen()),
    MenuRouter(
        route: PinteresScreen.nameRoute,
        icon: Icons.slideshow,
        name: 'Pinteres',
        screen: const PinteresScreen()),
    MenuRouter(
        route: EmergencyLayoutScreen.nameRoute,
        icon: Icons.slideshow,
        name: 'Emergency Layout',
        screen: const EmergencyLayoutScreen()),
    MenuRouter(
        route: SliderListScreen.nameRoute,
        icon: Icons.slideshow,
        name: 'Slider List Screen',
        screen: const SliderListScreen()),
    MenuRouter(
        route: AnimateDoScreen.nameRoute,
        icon: Icons.animation,
        name: 'Animate Do',
        screen: const AnimateDoScreen()),
    MenuRouter(
        route: ShopScreen.nameRoute,
        icon: Icons.shop,
        name: 'Shop',
        screen: const ShopScreen()),
    MenuRouter(
        route: PlayerMuiscScreen.nameRoute,
        icon: Icons.music_note,
        name: 'Player Music',
        screen: const PlayerMuiscScreen()),

  ];
  static Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    return MaterialPageRoute(builder: (context) => const NotFoundScreen());
  }

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};
    routes.addAll({'/': (BuildContext build) => const HomeScreen()});

    for (final item in menuOptions) {
      routes.addAll({item.route: (BuildContext build) => item.screen});
    }
    return routes;
  }
}
