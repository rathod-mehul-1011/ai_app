// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';

import '../common/common.dart';

class ImageViewer extends StatelessWidget {
  final File image;

  const ImageViewer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top-left positioned back button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: IconButton(
              visualDensity: VisualDensity.comfortable,
              icon: Icon(Icons.arrow_back_ios_rounded, size: 18),
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: isDarkMode(context) ? Colors.white : Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          // Centered content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Edited",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Image.file(
                  image,
                  height: 412 * scaleFactor(context),
                  width: 260 * scaleFactor(context),
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Add your Row children here
                    Icon(Icons.star, color: Colors.yellow),
                    Text("Your text here"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
