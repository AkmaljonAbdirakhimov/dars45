import 'package:dars45/utils/app_constants.dart';
import 'package:dars45/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeModeToggled;
  const SettingsScreen({
    super.key,
    required this.onThemeModeToggled,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Sozlamalar"),
        centerTitle: true,
      ),
      drawer: CustomDrawer(
        onThemeModeToggled: widget.onThemeModeToggled,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Tungi Holat"),
            value: AppConstants.themeMode == ThemeMode.dark,
            onChanged: (value) {
              widget.onThemeModeToggled(value);
            },
          ),
        ],
      ),
    );
  }
}