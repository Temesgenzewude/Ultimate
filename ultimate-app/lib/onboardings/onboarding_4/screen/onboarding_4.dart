import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';

class OnBoardingFour extends StatefulWidget {
  const OnBoardingFour({Key? key}) : super(key: key);

  @override
  State<OnBoardingFour> createState() => _OnBoardingFourState();
}

class _OnBoardingFourState extends State<OnBoardingFour> {
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      backgroundColor: grey100,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          logo,
                          width: 48,
                          height: 48,
                        ),
                        AnimationClick(
                          child: Text(
                            'SKIP NOW',
                            style: headline(color: primary),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Souper Sunday for soup recipes'.toUpperCase(),
                        style: header(color: grey1100, letterSpacing: 2),
                      ),
                      const SizedBox(height: 24),
                      Text(
                          'Establish your own food awards and share your favourites with your',
                          style: body(color: grey800))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppWidget.typeButtonStartAction(
                            context: context,
                            input: 'Get Starter',
                            onPressed: () {},
                            bgColor: primary,
                            borderColor: primary,
                            textColor: grey1100),
                      ),
                      const Expanded(child: SizedBox())
                    ],
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            onBoarding4,
            width: width,
            height: height / 2,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
