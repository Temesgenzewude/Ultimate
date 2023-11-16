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
  green,
  stPatricksBlue,
  corn1,
  lightSalmon,
  emerald1,
  primary
];

final List<String> titles = [
  onBoarding10,
  onBoarding9,
  onBoarding82,
  onBoarding9,
  onBoarding10,
  onBoarding82,
];

class OnBoardingTen extends StatefulWidget {
  const OnBoardingTen({Key? key}) : super(key: key);

  @override
  State<OnBoardingTen> createState() => _OnBoardingTenState();
}

class _OnBoardingTenState extends State<OnBoardingTen> {
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
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(24)),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                titles[index],
                height: height / 1.8,
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<SliderBloc, int>(
                          builder: (context, state) {
                            return OnBoardingWidget.createIndicator(
                                lengthImage: titles.length,
                                currentImage: state);
                          },
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
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 48),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: '0.1% ',
                        style: header(color: corn1),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Federal Republic of Germany 2026',
                            style: header(color: grey1100),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height / 1.6,
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
            Padding(
              padding: const EdgeInsets.all(16),
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
    );
  }
}
