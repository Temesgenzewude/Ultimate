import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/slider/bloc_slider.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../widget/onboarding_widget.dart';

final List<String> landings = [
  onBoarding3,
  onBoarding3,
  onBoarding3,
  onBoarding3
];

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    final SliderBloc sliderBloc = BlocProvider.of<SliderBloc>(context);
    return Scaffold(
      backgroundColor: grey100,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: width,
                height: height,
                child: Image.asset(
                  onBoarding3,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      gradient: Theme.of(context).colorLinearBottom),
                ),
              ),
            ],
          ),
          Positioned(
            top: 80,
            child: Image.asset(
              logo,
              width: 48,
              height: 48,
              color: grey1100,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 8,
            right: 8,
            child: Container(
              width: width,
              height: height / 2.8,
              decoration: BoxDecoration(
                  color: grey200, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: BlocBuilder<SliderBloc, int>(
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
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: ListView(
                                children: [
                                  Text(
                                    '0${index + 1}.',
                                    style: title1(color: corn1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      'Create a gift guide for food lovers',
                                      style: title1(
                                          color: grey1100, letterSpacing: 1),
                                    ),
                                  ),
                                  Text(
                                      'Establish your own food awards and share your favourites with your',
                                      style: body(color: grey800))
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
                        AnimationClick(
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(16)),
                            child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  icArrowRight,
                                  color: grey1100,
                                  width: 24,
                                  height: 24,
                                )),
                          ),
                        )
                      ],
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
