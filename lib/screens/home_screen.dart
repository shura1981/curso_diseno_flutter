import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/app_route.dart';
import '../theme/themechanger.dart';

class HomeScreen extends StatelessWidget {
  static const nameRoute = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      drawer: const _MenuDrawer(),
      body: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: _ListaOpciones(),
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones([this.isMenuDrawer = false]);
  final bool isMenuDrawer;

  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<ThemeChanger>(context);
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(
      ),
      itemCount: AppRoute.menuOptions.length,
      itemBuilder: (context, index) {
        final item = AppRoute.menuOptions[index];
        return ListTile(
          leading: Icon(item.icon, color: provider.currentTheme!.primaryColor,),
          title: Text(item.name),
          trailing: !isMenuDrawer ? Icon(Icons.chevron_right,  color: provider.currentTheme!.primaryColor) : null,
          onTap: () {
            if (isMenuDrawer) {
              Navigator.pop(context);
            }
            Navigator.pushNamed(context, item.route);
          },
        );
      },
    );
  }
}

class _MenuDrawer extends StatelessWidget {
  const _MenuDrawer();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.all(5),
              child: Center(
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundColor:
                        themeProvider.currentTheme!.primaryColor,
                    radius: 50,
                    child: const Text('JL'),
                  ),
                ),
              ),
            ),
          ),
          const Expanded(child: _ListaOpciones(true)),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                value
                    ? themeProvider.setDarkMode()
                    : themeProvider.setLightMode();
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.thermostat),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
              value: themeProvider.isCustomTheme,
              onChanged: (value) {
                if (value) {
                  themeProvider.setCustom();
                } else {
                  themeProvider.setLightMode();
                }
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Sytem Theme'),
            trailing: Switch.adaptive(
              value: themeProvider.isSytemTheme,
              onChanged: (value) {
                if (value) {
                  themeProvider.setSystemMode();
                } else {
                  themeProvider.setLightMode();
                }
              },
            ),
          ),
          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Cerrar'),
              onTap: () {
                // finalizar la app
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
