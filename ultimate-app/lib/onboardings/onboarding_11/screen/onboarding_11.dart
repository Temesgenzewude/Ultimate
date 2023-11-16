import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/slider/bloc_slider.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../widget/onboarding_widget.dart';

final List<String> landings = [
  onBoarding11,
  onBoarding11,
  onBoarding11,
];

class OnBoardingElevent extends StatefulWidget {
  const OnBoardingElevent({Key? key}) : super(key: key);

  @override
  State<OnBoardingElevent> createState() => _OnBoardingEleventState();
}

class _OnBoardingEleventState extends State<OnBoardingElevent> {
  PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.7,
  );
  Widget landing(BuildContext context, int index, double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Image.asset(
        landings[index],
        height: height / 2.5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    final SliderBloc sliderBloc = BlocProvider.of<SliderBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    logo,
                    width: 56,
                    height: 56,
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<SliderBloc, int>(
                builder: (context, state) {
                  return PageView.builder(
                    padEnds: false,
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: landings.length,
                    onPageChanged: (value) {
                      if (value > state) {
                        sliderBloc.add(SwipeRight());
                      } else {
                        sliderBloc.add(SwipeLeft());
                      }
                    },
                    itemBuilder: (context, index) {
                      return landing(context, index, width, height);
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Accumulate for your sustainable future.',
                    style: header(color: grey1100, letterSpacing: 2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: BlocBuilder<SliderBloc, int>(
                      builder: (context, state) {
                        return OnBoardingWidget.createIndicator(
                            lengthImage: landings.length, currentImage: state);
                      },
                    ),
                  ),
                  AppWidget.typeButtonStartAction2(
                      context: context,
                      input: 'Continue with Apple',
                      onPressed: () {},
                      bgColor: const Color(0xFFFFFFF),
                      icon: apple2,
                      colorAsset: grey1100,
                      sizeAsset: 24,
                      borderColor: const Color(0xFFFFFFF),
                      textColor: grey1100),
                  const SizedBox(height: 24),
                  AppWidget.typeButtonStartAction2(
                      context: context,
                      input: 'Continue with Google',
                      onPressed: () {},
                      bgColor: const Color(0xFFFF647C),
                      icon: google2,
                      sizeAsset: 24,
                      colorAsset: grey1100,
                      borderColor: const Color(0xFFFF647C),
                      textColor: grey1100)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
