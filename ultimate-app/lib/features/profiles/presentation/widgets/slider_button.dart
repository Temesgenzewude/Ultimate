import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';

// ignore: must_be_immutable
class SliderButton extends StatefulWidget {
  SliderButton(
      {super.key,
      required PageController pageController,
      required this.direction,
      required this.length})
      : _pageController = pageController;

  String direction;
  final PageController _pageController;
  final int length;

  @override
  State<SliderButton> createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  @override
  int _currentPage = 0;
  Color _leftButtonColor = grey600;
  Color _rightButtonColor = primary;

  @override
  void initState() {
    super.initState();
    widget._pageController.addListener(() {
      setState(() {
        _currentPage = widget._pageController.page!.round();
        _updateButtonColors();
      });
    });
  }

  void _updateButtonColors() {
    _leftButtonColor = _currentPage == 0 ? grey600 : primary;
    _rightButtonColor = _currentPage == widget.length - 1 ? grey600 : primary;
  }

  Widget build(BuildContext context) {
    return AnimationClick(
      function: () {
        if (widget.direction == 'right') {
          widget._pageController.nextPage(
            duration: const Duration(
              milliseconds: 200,
            ),
            curve: Curves.ease,
          );
        } else {
          widget._pageController.previousPage(
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
          color:
              widget.direction == 'left' ? _leftButtonColor : _rightButtonColor,
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
          widget.direction == 'right' ? icArrowRight : icArrowLeft,
          width: 24,
          height: 24,
          color: grey1100,
        ),
      ),
    );
  }
}
