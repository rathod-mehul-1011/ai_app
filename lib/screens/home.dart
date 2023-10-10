// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ai_app/provider/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/feature_tile.dart';
import '../widgets/image_uploader.dart';
import '../widgets/image_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedValue = 'Light';

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> carouselNotifier = ValueNotifier<int>(0);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(right: 10, top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                underline: SizedBox(),
                borderRadius: BorderRadius.circular(10),
                value: _selectedValue,
                items: ['Light', 'Dark', 'System']
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue!;
                    switch (newValue) {
                      case 'Light':
                        Provider.of<ThemeNotifier>(context, listen: false)
                            .setTheme(lightTheme);
                        break;
                      case 'Dark':
                        Provider.of<ThemeNotifier>(context, listen: false)
                            .setTheme(darkTheme);
                        break;
                      case 'System':
                        var brightness =
                            MediaQuery.of(context).platformBrightness;
                        Provider.of<ThemeNotifier>(context, listen: false)
                            .setTheme(brightness == Brightness.dark
                                ? darkTheme
                                : lightTheme);
                        break;
                    }
                  });
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                FeatureTile(carouselNotifier: carouselNotifier),
                SizedBox(height: 50),
                ImageUploader(),
                SizedBox(height: 60),
                ImageCarousel(carouselNotifier: carouselNotifier),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
