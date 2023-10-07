// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ai_app/common/colors.dart';
import 'package:ai_app/common/common.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17, vertical: 0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Remove ',
                          style: TextStyle(
                            color: AppColors.heliotrope,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                        ),
                        TextSpan(
                          text: 'unwanted things in',
                          style: TextStyle(
                            color: isDarkMode(context)
                                ? Colors.white
                                : AppColors.mineShaft,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                        ),
                        TextSpan(
                          text: ' seconds',
                          style: TextStyle(
                            color: AppColors.shockingPink,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 46, vertical: 0),
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Upload, mark the bit you need removed, download Free to use. No signup required!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.emperor,
                      fontWeight: FontWeight.w400,
                      fontSize: 7,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
