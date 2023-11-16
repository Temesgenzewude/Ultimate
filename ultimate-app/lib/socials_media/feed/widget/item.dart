import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/slider/bloc_slider.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../widget/onboarding_widget.dart';

class ItemPost extends StatelessWidget {
  const ItemPost({super.key, required this.item});
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final SliderBloc sliderBloc = BlocProvider.of<SliderBloc>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimationClick(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: Image.asset(item['avt'], width: 48, height: 48),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              item['name'],
                              style: headline(color: grey1100),
                            ),
                            const SizedBox(width: 4),
                            Image.asset(checkbox, width: 24, height: 24)
                          ],
                        ),
                        AnimationClick(
                          child: Image.asset(
                            dotsThreeVertical,
                            width: 24,
                            height: 24,
                            color: grey600,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      item['time'],
                      style: subhead(color: grey800),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: height / 2.3,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AnimationClick(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      color: item['bgColor'],
                      borderRadius: BorderRadius.circular(16)),
                  child: BlocBuilder<SliderBloc, int>(
                    builder: (context, state) {
                      return PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: item['bgImage'].length,
                        onPageChanged: (value) {
                          if (value > state) {
                            sliderBloc.add(SwipeRight());
                          } else {
                            sliderBloc.add(SwipeLeft());
                          }
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: item['bgColor'] != null ? 24 : 0,
                                horizontal: item['bgColor'] != null ? 32 : 0),
                            child: Image.asset(
                              item['bgImage'][index],
                              fit: item['bgColor'] != null ? null : BoxFit.fill,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                child: BlocBuilder<SliderBloc, int>(
                  builder: (context, state) {
                    return OnBoardingWidget.createIndicator(
                        lengthImage: item['bgImage'].length,
                        currentImage: state);
                  },
                ),
              ),
              Positioned(
                bottom: 24,
                left: 8,
                child: AnimationClick(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: grey100,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Image.asset(piano, width: 14, height: 24),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item['music'],
                          style: subhead(color: grey600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: AnimationClick(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: grey100,
                        borderRadius: BorderRadius.circular(24)),
                    child: Text(
                      '1 - 13',
                      style: subhead(color: grey600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimationClick(
                child: Row(
                  children: [
                    Image.asset(
                      crownSimple,
                      width: 16,
                      height: 16,
                      color: grey600,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      item['crown'],
                      style: subhead(color: grey600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AnimationClick(
                  child: Row(
                    children: [
                      Image.asset(
                        chatsCircle,
                        width: 16,
                        height: 16,
                        color: grey600,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        item['chat'],
                        style: subhead(color: grey600),
                      )
                    ],
                  ),
                ),
              ),
              AnimationClick(
                child: Row(
                  children: [
                    Image.asset(
                      uploadSimple,
                      width: 16,
                      height: 16,
                      color: grey600,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      item['share'],
                      style: subhead(color: grey600),
                    )
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              AnimationClick(
                child: Image.asset(
                  bookmark,
                  width: 24,
                  height: 24,
                  color: grey600,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
