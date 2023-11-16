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
  blueLight,
  stPatricksBlue,
  corn1,
  lightSalmon,
  emerald1,
  primary
];

final List<String> titles = [
  onBoarding9,
  onBoarding1,
  onBoarding12,
  onBoarding9,
  onBoarding1,
  onBoarding12,
];

class OnBoardingNine extends StatefulWidget {
  const OnBoardingNine({Key? key}) : super(key: key);

  @override
  State<OnBoardingNine> createState() => _OnBoardingNineState();
}

class _OnBoardingNineState extends State<OnBoardingNine> {
  PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );
  Widget landing(BuildContext context, int index, double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: height / 2,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(24)),
            ),
            Positioned(
              top: 0,
              child: Image.asset(
                titles[index],
                height: height / 2,
                fit: BoxFit.cover,
              ),
            ),
          ],
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            BlocBuilder<SliderBloc, int>(
              builder: (context, state) {
                return OnBoardingWidget.createIndicator(
                    lengthImage: titles.length, currentImage: state);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Return on Assets',
                    style: header(color: grey1100, letterSpacing: 2),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Open an app geared toward stock trading, and you’ll probably',
                    textAlign: TextAlign.center,
                    style: body(color: grey800),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: BlocBuilder<SliderBloc, int>(
                  builder: (context, state) {
                    return PageView.builder(
                      padEnds: false,
                      controller: controller,
                      scrollDirection: Axis.horizontal,
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
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppWidget.typeButtonStartAction(
                  context: context,
                  input: 'Get Starter',
                  onPressed: () {},
                  bgColor: primary,
                  borderColor: primary,
                  textColor: grey1100),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: AnimationClick(
                child: Text(
                  'Skip',
                  style: title4(color: primary),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
