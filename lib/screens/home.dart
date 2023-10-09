// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widgets/feature_tile.dart';
import '../widgets/image_uploader.dart';
import '../widgets/image_carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> carouselNotifier = ValueNotifier<int>(0);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              FeatureTile(carouselNotifier: carouselNotifier),
              SizedBox(height: 50),
              ImageUploader(),
              SizedBox(height: 60),
              ImageCarousel(carouselNotifier: carouselNotifier),
            ],
          ),
        ),
      ),
    );
  }
}
