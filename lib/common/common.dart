// helper function to calculate the scale factor.
import 'package:flutter/material.dart';

double scaleFactor(BuildContext context) {
  // Get the screen width
  double screenWidth = MediaQuery.of(context).size.width;

  // Base width (the width the design was made for)
  double baseWidth = 360.0;

  // Calculate the scale factor
  return screenWidth / baseWidth;
}

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

String capitalizeFirstLetter(String text) {
  if (text == '' || text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}
