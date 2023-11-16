import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(
          context: context, hasLeading: true, hasPop: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Text(
              'Success',
              textAlign: TextAlign.center,
              style: title1(color: grey1100),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: Text(
                'Establish your own food awards and share your favourites with you',
                textAlign: TextAlign.center,
                style: headline(color: grey700),
              ),
            ),
            Expanded(child: Image.asset(success)),
            AnimationClick(
              child: Text(
                'Check your order',
                style: headline(color: corn1),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: AppWidget.typeButtonStartAction(
                  context: context,
                  input: 'Continue Order',
                  borderColor: primary,
                  onPressed: () {},
                  bgColor: primary,
                  textColor: grey1100),
            ),
          ],
        ),
      ),
    );
  }
}
