import 'package:flutter/material.dart';

import '../routes/app_route.dart';

class HomeScreen extends StatelessWidget {
  static const nameRoute = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: ListView.builder(
        itemCount: AppRoute.menuOptions.length,
        itemBuilder: (context, index) {
          final item = AppRoute.menuOptions[index];
          return ListTile(
            leading: Icon(item.icon),
            title: Text(item.name),
            onTap: () {
              Navigator.pushNamed(context, item.route);
            },
          );
        },
        ),
    );
  }
}
