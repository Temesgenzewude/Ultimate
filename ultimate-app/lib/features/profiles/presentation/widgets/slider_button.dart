import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';

// ignore: must_be_immutable
class SliderButton extends StatelessWidget {
  SliderButton({
    super.key,
    required PageController pageController,
    required this.direction,
  }) : _pageController = pageController;

  String direction;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return AnimationClick(
      function: () {
        if (direction == 'right') {
          _pageController.nextPage(
            duration: const Duration(
              milliseconds: 200,
            ),
            curve: Curves.ease,
          );
        } else {
          _pageController.previousPage(
            duration: const Duration(
              milliseconds: 200,
            ),
            curve: Curves.ease,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              color: Color.fromARGB(222, 0, 0, 0),
              offset: Offset(0, 2),
              // blurStyle: BlurStyle.outer,
              spreadRadius: 2,
            )
          ],
        ),
        child: Image.asset(
          direction == 'right' ? icArrowRight : icArrowLeft,
          width: 24,
          height: 24,
          color: grey1100,
        ),
      ),
    );
  }
}