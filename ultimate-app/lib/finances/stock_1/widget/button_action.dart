import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';

Widget buttonAction(
    {double? fontSize,
    required BuildContext context,
    double? height,
    double? vertical,
    double? horizontal,
    Function()? onPressed,
    Color? bgColor,
    Color? borderColor,
    double miniSizeHorizontal = double.infinity,
    Color? textColor,
    String? input1,
    String? input2,
    FontWeight? fontWeight,
    double borderRadius = 16,
    double sizeAsset = 16,
    Color? colorAsset,
    String? icon}) {
  return AnimationClick(
    child: TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: vertical ?? 18, horizontal: horizontal ?? 0),
        side: BorderSide(color: borderColor ?? grey1100),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        backgroundColor: bgColor,
        minimumSize: Size(miniSizeHorizontal, 0),
      ),
      onPressed: onPressed,
      child: Column(
        children: [
          Text(
            input1!,
            textAlign: TextAlign.center,
            style: headline(color: textColor),
          ),
          Text(
            input2!,
            textAlign: TextAlign.center,
            style: subhead(color: grey1100),
          )
        ],
      ),
    ),
  );
}
