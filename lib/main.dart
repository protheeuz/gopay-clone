import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system; // Default menggunakan sistem

  @override
  void initState() {
    super.initState();
    _loadThemeMode(); // Load dari SharedPreferences
  }

  Future<void> _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString('theme_mode');
    setState(() {
      if (theme == 'light') {
        _themeMode = ThemeMode.light;
      } else if (theme == 'dark') {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.system;
      }
    });
  }

  Future<void> _updateThemeMode(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _themeMode = themeMode;
    });
    await prefs.setString(
      'theme_mode',
      themeMode == ThemeMode.light
          ? 'light'
          : themeMode == ThemeMode.dark
              ? 'dark'
              : 'system',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoPay Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Yrsa'),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode, // ThemeMode diambil dari state
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.getRoutes(
        onThemeChanged: _updateThemeMode, // Pass function to change theme
      ),
    );
  }
}
