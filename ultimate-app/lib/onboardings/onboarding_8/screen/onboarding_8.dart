import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/slider/bloc_slider.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../widget/onboarding_widget.dart';

final List<Color> colors = [
  emerald1,
  grey200,
  blueLight,
  lightSalmon,
  stPatricksBlue,
  green
];

final List<Map<String, String>> titles = [
  {'title': 'Ciate Palemore Lipstick Bold Red Color', 'image': onBoarding8},
  {'title': 'Payment Method Added', 'image': onBoarding82},
  {'title': 'Ciate Palemore Lipstick Bold Red Color', 'image': onBoarding8},
  {'title': 'Payment Method Added', 'image': onBoarding82},
  {'title': 'Ciate Palemore Lipstick Bold Red Color', 'image': onBoarding8},
  {'title': 'Payment Method Added', 'image': onBoarding82},
];

class OnBoardingEight extends StatefulWidget {
  const OnBoardingEight({Key? key}) : super(key: key);

  @override
  State<OnBoardingEight> createState() => _OnBoardingEightState();
}

class _OnBoardingEightState extends State<OnBoardingEight> {
  PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.7,
  );
  Widget landing(BuildContext context, int index, double width, double height) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SizedBox(
          height: height / 1.7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: colors[index],
                    borderRadius: BorderRadius.circular(24)),
              ),
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: Text(
                  titles[index]['title']!,
                  style: header(color: grey1100, letterSpacing: 2),
                ),
              ),
              Positioned(
                bottom: 16,
                child: Image.asset(
                  titles[index]['image']!,
                  height: height / 3,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    final SliderBloc sliderBloc = BlocProvider.of<SliderBloc>(context);
    return Scaffold(
      floatingActionButton: AnimationClick(
        child: Container(
          width: width / 3,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Go Now',
                style: title4(color: grey1100),
              ),
              const SizedBox(width: 8),
              Image.asset(icKeyboardRight,
                  color: grey1100, width: 24, height: 24)
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
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
                    'Skip',
                    style: title4(color: primary),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: height / 1.7,
              child: Row(
                children: [
                  Expanded(
                    child: BlocBuilder<SliderBloc, int>(
                      builder: (context, state) {
                        return PageView.builder(
                          padEnds: false,
                          controller: controller,
                          scrollDirection: Axis.vertical,
                          itemCount: titles.length,
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
                    padding: const EdgeInsets.only(right: 8),
                    child: BlocBuilder<SliderBloc, int>(
                      builder: (context, state) {
                        return OnBoardingWidget.createIndicator(
                            lengthImage: titles.length, currentImage: state);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
