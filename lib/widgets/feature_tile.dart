// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/common.dart';
import '../common/data.dart';

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
  String currentTitle = '', currentDesc = '';

  @override
  void initState() {
    super.initState();
    currentTitle = featureList[widget.carouselNotifier.value].title;
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
      currentTitle = featureList[widget.carouselNotifier.value].title;
      currentDesc = featureList[widget.carouselNotifier.value].desc;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> words = currentTitle.split(' ');

    String firstWord = words.first;
    String middleSentence = words.sublist(1, words.length - 1).join(' ');
    String lastWord = words.last;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.carouselNotifier.value == 2 ? 0 : 40,
        vertical: 0,
      ),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$firstWord ',
                  style: TextStyle(
                    color: AppColors.heliotrope,
                    fontWeight: FontWeight.w700,
                    fontSize: 28 * scaleFactor(context),
                  ),
                ),
                TextSpan(
                  text: middleSentence,
                  style: TextStyle(
                    color: isDarkMode(context)
                        ? Colors.white
                        : AppColors.mineShaft,
                    fontWeight: FontWeight.w700,
                    fontSize: 28 * scaleFactor(context),
                  ),
                ),
                TextSpan(
                  text: ' $lastWord',
                  style: TextStyle(
                    color: AppColors.shockingPink,
                    fontWeight: FontWeight.w700,
                    fontSize: 28 * scaleFactor(context),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
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
      ),
    );
  }
}
