import 'package:dars45/views/screens/home_screen.dart';
import 'package:dars45/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text("MENYU"),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) {
                return HomeScreen();
              }));
            },
            leading: const Icon(Icons.home),
            title: const Text("Kompaniyalar"),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) {
                return SettingsScreen();
              }));
            },
            leading: const Icon(Icons.settings),
            title: const Text("Sozlamalar"),
          ),
        ],
      ),
    );
  }
}
