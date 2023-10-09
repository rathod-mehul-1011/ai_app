// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import './screens/home.dart';
import '../common/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI App',
      debugShowCheckedModeBanner: false,
      // Light theme
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),

      // Dark theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(primary: AppColors.primaryColor),
        useMaterial3: true,
      ),

      // Determines which theme to use
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
