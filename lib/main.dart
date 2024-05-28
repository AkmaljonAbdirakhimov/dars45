import 'package:dars45/utils/app_constants.dart';
import 'package:dars45/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void toggleThemeMode(bool isDark) {
    AppConstants.themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: AppConstants.themeMode,
      home: HomeScreen(
        onThemeModeToggled: toggleThemeMode,
      ),
    );
  }
}
