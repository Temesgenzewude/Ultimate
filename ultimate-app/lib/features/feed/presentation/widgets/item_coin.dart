// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/styles.dart';
import 'package:flutter_ultimate/common/widget/gradient_text.dart';

class ItemIcon extends StatelessWidget {
  ItemIcon({
    super.key,
    required this.color,
    required this.icon,
    required this.money,
    required this.rate,
  });
  String icon;
  String money;
  String rate;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 18, height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GradientText(
            '\$$money',
            style: const TextStyle(
                fontSize: 18, height: 1.2, fontFamily: 'SpaceGrotesk'),
            gradient: LinearGradient(colors: [
              const Color(0xFFCFE1FD).withOpacity(0.9),
              const Color(0xFFFFFDE1).withOpacity(0.9),
            ]),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(12)),
          child: Text(
            rate,
            style: caption1(color: grey1100),
          ),
        )
      ],
    );
  }
}
