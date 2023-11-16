import 'package:flutter/material.dart';
import '../../../common/constant/colors.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    Key? key,
    required this.child,
    this.style,
    this.gradient,
    this.thickness = 2,
  }) : super(key: key);
  final Widget child;
  final ButtonStyle? style;
  final Gradient? gradient;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          gradient: gradient,
          borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
            color: grey200, borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.all(thickness),
        child: Center(child: child),
      ),
    );
  }
}
