import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/slider/bloc_slider.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../widget/onboarding_widget.dart';

final List<Color> colors = [
  green,
  stPatricksBlue,
  corn1,
  lightSalmon,
  emerald1,
  primary
];

final List<String> landings = [
  onBoarding5,
  onBoarding5,
  onBoarding5,
  onBoarding5,
  onBoarding5,
  onBoarding5
];

class OnBoardingFive extends StatefulWidget {
  const OnBoardingFive({Key? key}) : super(key: key);

  @override
  State<OnBoardingFive> createState() => _OnBoardingFiveState();
}

class _OnBoardingFiveState extends State<OnBoardingFive> {
  PageController controller = PageController(
    initialPage: 1,
    viewportFraction: 0.9,
  );
  Widget landing(BuildContext context, int index, double width, double height) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: height / 2.2,
            decoration: BoxDecoration(
                color: colors[index], borderRadius: BorderRadius.circular(24)),
          ),
          Positioned(
              bottom: 0,
              child: Image.asset(
                landings[index],
                height: height / 2,
                fit: BoxFit.fill,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    final SliderBloc sliderBloc = BlocProvider.of<SliderBloc>(context);
    return Scaffold(
      backgroundColor: grey100,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<SliderBloc, int>(
                          builder: (context, state) {
                            return OnBoardingWidget.createIndicator(
                                lengthImage: landings.length,
                                currentImage: state);
                          },
                        ),
                        Image.asset(
                          logo,
                          width: 48,
                          height: 48,
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: Text(
                          'Browse Through Unique Digital Art',
                          textAlign: TextAlign.center,
                          style: title1(color: grey1100, letterSpacing: 1),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                            "We're a team of the most futuristic neon pink robots in the universe.",
                            textAlign: TextAlign.center,
                            style: body(color: grey800)),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppWidget.typeButtonStartAction(
                              context: context,
                              input: 'Get Starter',
                              onPressed: () {},
                              bgColor: grey200,
                              borderColor: grey200,
                              textColor: grey600),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: AppWidget.typeButtonStartAction(
                              context: context,
                              input: 'Get Starter',
                              onPressed: () {},
                              bgColor: primary,
                              borderColor: primary,
                              textColor: grey1100),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 2,
              child: BlocBuilder<SliderBloc, int>(
                builder: (context, state) {
                  return PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: landings.length,
                    controller: controller,
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
          ],
        ),
      ),
    );
  }
}
