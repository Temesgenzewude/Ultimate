import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';

class UploadImage {
  Widget dotted() {
    return DottedBorder(
      color: grey400,
      borderType: BorderType.RRect,
      dashPattern: const [8, 4],
      radius: const Radius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                plusCircle,
                width: 24,
                height: 24,
                color: grey600,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Select Image',
                  style: body(color: grey600),
                ),
              ),
              Text(
                '(1-6 images)',
                style: subhead(color: grey600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
