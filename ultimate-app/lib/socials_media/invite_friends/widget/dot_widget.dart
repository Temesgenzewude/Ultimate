import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../common/constant/colors.dart';

import '../../../common/constant/styles.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: grey300,
      borderType: BorderType.RRect,
      dashPattern: const [8, 4],
      radius: const Radius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            'Ultimatelinkref/ULR1313',
            style: headline(color: grey1100),
          ),
        ),
      ),
    );
  }
}
