// ignore_for_file: prefer_const_constructors

import 'package:ai_app/provider/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(lightTheme), // Default theme is lightTheme
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'AI App',
      debugShowCheckedModeBanner: false,
      // Light theme
      theme: themeNotifier.getTheme(),
      themeMode: ThemeMode.system,

      home: HomeScreen(),
    );
  }
}
