import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/menu_app_controller.dart';
import 'provider/current_view_provider.dart';
import 'routes/app_route.dart';
import 'screens/shop_screen/models/shoes.dart';
import 'screens/shop_screen/models/shoes_provider.dart';
import 'share_preference/preferences.dart';
import 'theme/themechanger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeChanger(optionTheme: Preferences.optionTheme)),
      ChangeNotifierProvider(create: (_) => CurrentViewProvider()),
      ChangeNotifierProvider(create: (_) => MenuAppController()),
      ChangeNotifierProvider(create: (_) => ShoesProvider(shoes[0])),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const _MaterialApp();
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: provider.currentTheme,
      initialRoute: AppRoute.initialRoute,
      routes: AppRoute.getRoutes(),
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
