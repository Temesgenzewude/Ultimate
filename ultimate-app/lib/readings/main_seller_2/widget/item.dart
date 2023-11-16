import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/slider/bloc_slider.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import 'onboarding_widget.dart';

class ItemPost extends StatelessWidget {
  const ItemPost({super.key, required this.items});
  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    final SliderBloc sliderBloc = BlocProvider.of<SliderBloc>(context);
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: height / 2.3,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: BlocBuilder<SliderBloc, int>(
                builder: (context, state) {
                  return PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    onPageChanged: (value) {
                      if (value > state) {
                        sliderBloc.add(SwipeRight());
                      } else {
                        sliderBloc.add(SwipeLeft());
                      }
                    },
                    itemBuilder: (context, index) {
                      return AnimationClick(
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(items[index]['bgImage'],
                                    fit: BoxFit.cover,
                                    height: height / 2.3,
                                    width: width),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: height / 2,
                                width: width,
                                decoration: BoxDecoration(
                                    gradient:
                                        Theme.of(context).colorLinearBottom3),
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 32,
                              right: 32,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index]['title'],
                                    style: title3(color: grey1100),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 24),
                                    child: Text(
                                      items[index]['time'],
                                      style: caption1(color: grey600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Positioned(
              bottom: 32,
              left: 16,
              right: 32,
              child: BlocBuilder<SliderBloc, int>(
                builder: (context, state) {
                  return OnBoardingWidget.createIndicator(
                      lengthImage: items.length, currentImage: state);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
