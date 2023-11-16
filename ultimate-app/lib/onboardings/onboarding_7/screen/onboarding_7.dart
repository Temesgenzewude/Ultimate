import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/slider/bloc_slider.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../widget/onboarding_widget.dart';

final List<String> titles = [
  onBoarding7,
  onBoarding72,
  onBoarding7,
  onBoarding72,
  onBoarding7,
  onBoarding72,
];

class OnBoardingSeven extends StatefulWidget {
  const OnBoardingSeven({Key? key}) : super(key: key);

  @override
  State<OnBoardingSeven> createState() => _OnBoardingSevenState();
}

class _OnBoardingSevenState extends State<OnBoardingSeven> {
  PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );
  Widget landing(BuildContext context, int index, double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          titles[index],
          height: height / 1.8,
          fit: BoxFit.cover,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Image.asset(
                logo,
                width: 56,
                height: 56,
              ),
            ),
            SizedBox(
              height: height / 2,
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
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Directly answer customers’ financial',
                      style: header(color: grey1100, letterSpacing: 2),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Open an app geared toward stock trading, and you’ll probably discover a dictionary ',
                      style: body(color: grey800),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: BlocBuilder<SliderBloc, int>(
                      builder: (context, state) {
                        return OnBoardingWidget.createIndicator(
                            mainAxisAlignment: MainAxisAlignment.start,
                            lengthImage: titles.length,
                            currentImage: state);
                      },
                    ),
                  ),
                  Expanded(
                    child: AppWidget.typeButtonStartAction(
                        context: context,
                        input: 'Get Starter',
                        onPressed: () {},
                        bgColor: primary,
                        icon: icKeyboardRight,
                        colorAsset: grey1100,
                        borderColor: primary,
                        textColor: grey1100),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
