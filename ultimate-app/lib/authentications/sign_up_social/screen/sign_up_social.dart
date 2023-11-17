import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/gradient_text.dart';

class SignUpSocial extends StatefulWidget {
  const SignUpSocial({Key? key}) : super(key: key);

  @override
  State<SignUpSocial> createState() => _SignUpSocialState();
}

class _SignUpSocialState extends State<SignUpSocial> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height / 2.5,
            child: Stack(
              children: [
                Positioned(
                  top: -24,
                  left: -width / 10,
                  child: Image.asset(
                    bg3,
                    height: height / 2.2,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(logo, width: 48, height: 48),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: GradientText(
                          'Hi! Buddy',
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
                        'Outsource your welcome project and get it quickly done and delivered remotely online.',
                        style: body(color: grey800),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              checkColor: grey100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                    width: 1.0, color: grey500),
                              ),
                              focusColor: primary,
                              activeColor: primary,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              },
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'You agree with our ',
                              style: body(color: grey1100),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Term & Policy',
                                  style: headline(color: grey1100),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Get here!');
                                    },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      AppWidget.typeButtonStartAction2(
                          context: context,
                          input: 'Continue with Apple',
                          onPressed: () {},
                          bgColor: grey1100,
                          icon: icArrowRight,
                          colorAsset: grey100,
                          borderColor: grey1100,
                          textColor: grey100),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 24),
                        child: AppWidget.typeButtonStartAction(
                            context: context,
                            input: 'Continue with Email',
                            onPressed: () {},
                            bgColor: primary,
                            icon: icArrowRight,
                            colorAsset: grey1100,
                            borderColor: primary,
                            textColor: grey1100),
                      ),
                    ],
                  ),
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
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
