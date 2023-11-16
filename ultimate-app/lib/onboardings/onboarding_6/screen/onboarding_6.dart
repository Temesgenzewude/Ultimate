import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/slider/bloc_slider.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../widget/onboarding_widget.dart';

final List<Map<String, String>> titles = [
  {'title': 'Medical Home Tests & Monitoring', 'image': onBoarding6},
  {
    'title': 'Access thousands of trusted Doctors instantly!',
    'image': onBoarding6
  },
  {'title': 'Medical Home Tests & Monitoring', 'image': onBoarding6},
  {
    'title': 'Access thousands of trusted Doctors instantly!',
    'image': onBoarding6
  },
  {'title': 'Medical Home Tests & Monitoring', 'image': onBoarding6},
  {
    'title': 'Access thousands of trusted Doctors instantly!',
    'image': onBoarding6
  }
];

class OnBoardingSix extends StatefulWidget {
  const OnBoardingSix({Key? key}) : super(key: key);

  @override
  State<OnBoardingSix> createState() => _OnBoardingSixState();
}

class _OnBoardingSixState extends State<OnBoardingSix> {
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    final SliderBloc sliderBloc = BlocProvider.of<SliderBloc>(context);
    return Scaffold(
      backgroundColor: grey100,
      body: Column(
        children: [
          SizedBox(
            height: height / 4 * 3,
            width: width,
            child: BlocBuilder<SliderBloc, int>(
              builder: (context, state) {
                return PageView.builder(
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
                    return Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(
                                    index == titles.length - 1 ? 0 : 24),
                                bottomLeft:
                                    Radius.circular(index == 0 ? 0 : 24)),
                            child: Image.asset(
                              titles[index]['image']!,
                              fit: BoxFit.fill,
                              width: width,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 64,
                            left: 16,
                            right: width / 2.5,
                            child: Text(
                              titles[index]['title']!,
                              style: title1(color: grey1100, letterSpacing: 1),
                            )),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BlocBuilder<SliderBloc, int>(
                  builder: (context, state) {
                    return OnBoardingWidget.createIndicator(
                        lengthImage: titles.length, currentImage: state);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Are you a doctor?'.toUpperCase(),
                    style: footnote(color: grey1100),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Get here!'.toUpperCase(),
                        style: footnote(color: corn1),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Get here!');
                          },
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
