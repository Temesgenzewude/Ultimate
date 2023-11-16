import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/slider/bloc_slider.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../widget/button_swipe.dart';
import '../widget/onboarding_widget.dart';

final List<String> landings = [
  onBoarding2,
  onBoarding2,
  onBoarding2,
  onBoarding2
];

class OnBoardingTwo extends StatefulWidget {
  const OnBoardingTwo({Key? key}) : super(key: key);

  @override
  State<OnBoardingTwo> createState() => _OnBoardingTwoState();
}

class _OnBoardingTwoState extends State<OnBoardingTwo> {
  bool isFinished = false;
  Widget landing(BuildContext context, int index, double width, double height) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: width,
          child: Image.asset(
            landings[index],
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: height / 3,
            width: width,
            decoration:
                BoxDecoration(gradient: Theme.of(context).colorLinearBottom),
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            height: height / 3,
            width: width,
            decoration:
                BoxDecoration(gradient: Theme.of(context).colorLinearTop),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    final SliderBloc sliderBloc = BlocProvider.of<SliderBloc>(context);
    return Scaffold(
      backgroundColor: grey100,
      body: Container(
        margin: const EdgeInsets.only(top: 64, left: 8, right: 8),
        padding: const EdgeInsets.only(bottom: 48),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: grey200,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
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
                      style: headline(color: grey1100),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  BlocBuilder<SliderBloc, int>(
                    builder: (context, state) {
                      return PageView.builder(
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
                  Positioned(
                    bottom: 40,
                    child: BlocBuilder<SliderBloc, int>(
                      builder: (context, state) {
                        return OnBoardingWidget.createIndicator(
                            lengthImage: landings.length, currentImage: state);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 56),
                  child: Text(
                    'Digital game artist 3D',
                    textAlign: TextAlign.center,
                    style: header(color: grey1100, letterSpacing: 2),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                  child: Text(
                    'Is Zendesk currently experiencing a Service Incident?',
                    textAlign: TextAlign.center,
                    style: body(color: grey800),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SwipeableButtonView(
                buttonText: 'Swipe to start',
                buttonWidget: Container(
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                ),
                activeColor: const Color(0xFF009C41),
                isFinished: isFinished,
                onWaitingProcess: () {
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      isFinished = true;
                    });
                  });
                },
                onFinish: () async {
                  setState(() {
                    isFinished = false;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
