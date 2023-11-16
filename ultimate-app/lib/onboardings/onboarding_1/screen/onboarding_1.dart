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
  onBoarding1,
  onBoarding12,
  onBoarding1,
  onBoarding9,
  onBoarding1,
  onBoarding12
];

class OnBoardingOne extends StatefulWidget {
  const OnBoardingOne({Key? key}) : super(key: key);

  @override
  State<OnBoardingOne> createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.7,
  );
  Widget landing(BuildContext context, int index, double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: height / 2,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: colors[index], borderRadius: BorderRadius.circular(24)),
          ),
          Positioned(
              bottom: index % 2 == 0 ? -10 : 10,
              child: Image.asset(
                landings[index],
                height: height / 2.4,
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
      body: SafeArea(
        child: Column(
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
                  BlocBuilder<SliderBloc, int>(
                    builder: (context, state) {
                      return OnBoardingWidget.createIndicator(
                          lengthImage: landings.length, currentImage: state);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 1.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
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
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Private Wealth Management',
                      style: header(color: grey1100, letterSpacing: 2),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Why would I want to trade an Event Contract over another asset class?',
                      style: body(color: grey800),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppWidget.typeButtonStartAction(
                  context: context,
                  input: 'Continue',
                  onPressed: () {},
                  bgColor: primary,
                  icon: icArrowRight,
                  colorAsset: grey1100,
                  borderColor: primary,
                  textColor: grey1100),
            )
          ],
        ),
      ),
    );
  }
}
