// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home.dart';
import './common/colors.dart';
import './provider/theme_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.dark(
            primary: AppColors.primaryColor,
            background: AppColors.cinder,
          ),
          useMaterial3: true,
        ),
        themeMode: themeNotifier.themeOption == ThemeOption.system
            ? ThemeMode.system
            : (themeNotifier.themeOption == ThemeOption.light
                ? ThemeMode.light
                : ThemeMode.dark),
        home: HomeScreen(),
      ),
    );
  }
}
