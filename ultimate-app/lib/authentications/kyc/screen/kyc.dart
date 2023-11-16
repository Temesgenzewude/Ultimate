import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';

import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

class Kyc extends StatelessWidget {
  const Kyc({Key? key}) : super(key: key);

  Widget item(String title, String subTitle, Color bgColor, Function() onTap) {
    return AnimationClick(
      function: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: grey200, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(16)),
              child: Image.asset(newPaper, width: 28, height: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: headline(color: grey1100),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subTitle,
                    style: subhead(color: grey800),
                  )
                ],
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 28,
              color: grey500,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: AnimationClick(
            function: () => Navigator.of(context).pop(),
            child: Image.asset(
              icArrowLeft,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        right: AnimationClick(
            child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            'Skip',
            style: headline(color: corn1),
          ),
        )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Image.asset(
                bg6,
                height: height / 4,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 8),
                  child: GradientText(
                    'Verify eKYC',
                    style: const TextStyle(
                        fontSize: 48,
                        height: 1,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SpaceGrotesk'),
                    gradient: LinearGradient(colors: [
                      const Color(0xFFCFE1FD).withOpacity(0.9),
                      const Color(0xFFFFFDE1).withOpacity(0.9),
                    ]),
                  ),
                ),
                Text(
                  'Verify your identity as fast as you can',
                  textAlign: TextAlign.center,
                  style: body(color: grey800),
                ),
                const SizedBox(height: 32),
                item('Scan your ID, Passport', 'Take picture of both side card',
                    green, () {
                  print('Get here');
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: item('Take a Selfie', 'Verify Face', lightSalmon, () {
                    print('Get here');
                  }),
                ),
                item('Match Face', 'Matching card and selfie', stPatricksBlue,
                    () {
                  print('Get here');
                })
              ],
            ),
            const SizedBox(height: 24),
            AppWidget.typeButtonStartAction2(
                context: context,
                input: 'Continue',
                onPressed: () {},
                bgColor: primary,
                borderColor: primary,
                textColor: grey1100),
            const SizedBox(height: 48)
          ],
        ),
      ),
    );
  }
}
