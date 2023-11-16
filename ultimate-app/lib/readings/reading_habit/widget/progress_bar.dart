import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key, required this.width});
  final double width;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double width = 0;

  @override
  void initState() {
    Future<dynamic>.delayed(const Duration(seconds: 0)).whenComplete(() {
      if (mounted) {
        setState(() {
          width = widget.width;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: grey800, borderRadius: BorderRadius.circular(4)),
        ),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          height: 4,
          width: width,
          curve: Curves.linearToEaseOut,
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(16)),
        )
      ],
    );
  }
}
