import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../app/widget_support.dart';
import '../../../../../common/constant/colors.dart';
import '../../../../../common/constant/images.dart';

import '../../../../../common/constant/styles.dart';
import '../../../../../common/widget/animation_click.dart';
import '../../../../../common/widget/gradient_text.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(
          context: context,
          arrowColor: grey1100,
          hasLeading: true,
          hasPop: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              bg4,
              fit: BoxFit.fill,
              height: height / 4,
            ),
            const Expanded(child: SizedBox()),
            Column(
              children: [
                GradientText(
                  'Forgot Password?',
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
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                  child: Text(
                    'We have send magic link to email. Please verify email and access to Ultimate',
                    textAlign: TextAlign.center,
                    style: body(color: grey800),
                  ),
                ),
                AppWidget.typeButtonStartAction2(
                    context: context,
                    input: 'Open your Email',
                    onPressed: () {},
                    bgColor: primary,
                    icon: envelop,
                    colorAsset: grey1100,
                    borderColor: primary,
                    textColor: grey1100),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child: AppWidget.typeButtonStartAction(
                      context: context,
                      input: 'Send a new Email',
                      onPressed: () {},
                      bgColor: grey200,
                      borderColor: grey200,
                      textColor: grey1100),
                ),
                AnimationClick(
                    child: Text(
                  'Enter code manually',
                  style: title4(color: corn1),
                )),
              ],
            ),
            const Expanded(flex: 2, child: SizedBox()),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Have an account? ',
                style: headline(color: grey1100),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign In!',
                    style: headline(color: corn1),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Get here!');
                      },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
