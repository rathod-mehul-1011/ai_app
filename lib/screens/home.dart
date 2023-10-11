// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/feature_tile.dart';
import '../widgets/image_uploader.dart';
import '../widgets/image_carousel.dart';
import '../common/common.dart';
import '../provider/theme_notifier.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> carouselNotifier = ValueNotifier<int>(0);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(right: 10, top: 10),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: PopupMenuButton<ThemeOption>(
                  offset: Offset(10, 30),
                  onSelected: (newOption) {
                    Provider.of<ThemeNotifier>(context, listen: false)
                        .setTheme(newOption);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  itemBuilder: (BuildContext context) => ThemeOption.values
                      .map(
                        (ThemeOption option) => PopupMenuItem(
                          value: option,
                          height: 30,
                          child: Text(
                            capitalizeFirstLetter(
                              option.toString().split('.').last,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        capitalizeFirstLetter(
                          Provider.of<ThemeNotifier>(context, listen: false)
                              .themeOption
                              .toString()
                              .split('.')
                              .last,
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              isDarkMode(context) ? Colors.white : Colors.black,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
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
      ),
    );
  }
}
