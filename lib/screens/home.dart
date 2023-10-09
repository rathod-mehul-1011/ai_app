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
          padding: EdgeInsets.symmetric(horizontal: 43),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              FeatureTile(carouselNotifier: carouselNotifier),
              SizedBox(height: 49),
              ImageUploader(),
              SizedBox(height: 49),
              ImageCarousel(carouselNotifier: carouselNotifier),
            ],
          ),
        ),
      ),
    );
  }
}
