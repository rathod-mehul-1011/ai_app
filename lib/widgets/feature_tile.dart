// ignore_for_file: prefer_const_constructors

import 'package:ai_app/common/data.dart';
import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/theme_utils.dart';

class FeatureTile extends StatefulWidget {
  final ValueNotifier<int> carouselNotifier;

  const FeatureTile({
    super.key,
    required this.carouselNotifier,
  });

  @override
  State<FeatureTile> createState() => _FeatureTileState();
}

class _FeatureTileState extends State<FeatureTile> {
  String currentDesc = '';

  @override
  void initState() {
    super.initState();
    currentDesc = featureList[widget.carouselNotifier.value].desc;
    widget.carouselNotifier.addListener(_updateFeatureTile);
  }

  @override
  void dispose() {
    widget.carouselNotifier.removeListener(_updateFeatureTile);
    super.dispose();
  }

  void _updateFeatureTile() {
    // React to changes, for instance:
    setState(() {
      currentDesc = featureList[widget.carouselNotifier.value].desc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            currentDesc,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.emperor,
              fontWeight: FontWeight.w400,
              fontSize: 7,
            ),
          ),
        ),
      ],
    );
  }
}
