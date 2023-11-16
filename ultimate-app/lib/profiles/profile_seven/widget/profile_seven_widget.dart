import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../common/constant/colors.dart';

import '../../../common/constant/styles.dart';

class ProfileSevenWidget {
  Widget dotted() {
    return DottedBorder(
      color: grey400,
      borderType: BorderType.RRect,
      dashPattern: const [8, 4],
      radius: const Radius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: green, borderRadius: BorderRadius.circular(32)),
                child: const Icon(
                  Icons.add,
                  size: 32,
                  color: grey1100,
                ),
              ),
              Text(
                'Add New',
                style: body(color: grey800),
              )
            ],
          ),
        ),
      ),
    );
  }
}
