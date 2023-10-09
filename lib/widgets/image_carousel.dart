// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../common/data.dart';

class ImageCarousel extends StatefulWidget {
  final ValueNotifier<int> carouselNotifier;

  const ImageCarousel({
    super.key,
    required this.carouselNotifier,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList.map((path) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(
                  path,
                  fit: BoxFit.contain,
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
                widget.carouselNotifier.value = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((assetPath) {
            int index = imgList.indexOf(assetPath);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(66, 112, 235, 1)
                    : Color.fromRGBO(179, 199, 248, 1),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
