import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/responsive.dart';
import '../provider/current_view_provider.dart';
import '../routes/app_route.dart';
import '../theme/styles/custom_colors.dart';
import '../theme/themechanger.dart';

class ListaOpciones extends StatelessWidget {
  const ListaOpciones([
    this.isMenuDrawer = false,
    Key? key,
  ]) : super(key: key);
  final bool isMenuDrawer;

  @override
  Widget build(BuildContext context) {
    CustomColors cardCustomStyle = Theme.of(context).extension<CustomColors>()!;
    final providerViewCurrent =
        Provider.of<CurrentViewProvider>(context, listen: false);
    return ListView.separated(
      padding: const EdgeInsets.only(top: 0),
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: AppRoute.menuOptions.length,
      itemBuilder: (context, index) {
        final item = AppRoute.menuOptions[index];
        return ListTile(
          leading: Icon(item.icon, color: cardCustomStyle.primaryColor),
          title: Text(item.name),
          trailing: !isMenuDrawer
              ? Icon(Icons.chevron_right, color: cardCustomStyle.primaryColor)
              : null,
          onTap: () {
            if (Responsive.isMobile(context) && isMenuDrawer) {
              Navigator.pop(context);
            }

            if (Responsive.isMobile(context)) {
              Navigator.pushNamed(context, item.route);
            } else {
              providerViewCurrent.currentView = item.screen;
            }
          },
        );
      },
    );
  }
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
      ),
      child: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.all(5),
              child: Center(
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    backgroundColor: themeProvider.currentTheme!.primaryColor,
                    radius: 50,
                    child: const Text('JL'),
                  ),
                ),
              ),
            ),
             const Expanded(child: ListaOpciones(true)),
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
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Cerrar'),
              onTap: () {
                // finalizar la app
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
