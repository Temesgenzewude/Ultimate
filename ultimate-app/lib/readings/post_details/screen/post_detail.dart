import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/slider/bloc_slider.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../../main_seller_2/widget/onboarding_widget.dart';

List<String> images = [
  reading_post_detail_1,
  reading_habit_5,
  reading_interest_4
];

List<Map<String, dynamic>> relatedPosts = [
  <String, dynamic>{
    'title': 'A Collection of Classic Laser Neon Art',
    'time': 'February 29, 2012',
    'image': reading_interest_4
  },
  <String, dynamic>{
    'title': 'Discover the Exciting World of Digital Art',
    'time': 'February 29, 2012',
    'image': reading_interest_3
  },
  <String, dynamic>{
    'title': 'A Collection of Classic Laser Neon Art',
    'time': 'February 29, 2012',
    'image': reading_interest_6
  },
  <String, dynamic>{
    'title': 'Discover the Exciting World of Digital Art',
    'time': 'February 29, 2012',
    'image': reading_interest_7
  },
];

class PostDetail extends StatelessWidget {
  const PostDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
    final SliderBloc sliderBloc = BlocProvider.of<SliderBloc>(context);
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBarCpn(
        color: primary,
        left: AnimationClick(
          function: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              icArrowLeft,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        right: Row(
          children: [
            AnimationClick(
              child: Image.asset(
                bookmark_simple,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AnimationClick(
                child: Image.asset(
                  share,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Crypto Love is a curated collection of artworks from artists around the world.',
                    style: title1(color: grey1100),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.asset(
                                    avtFemale,
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Albert Flores',
                                  style: title4(color: grey900),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Jul 9, 2023 - 13  mins read',
                              style: body(color: grey800),
                            )
                          ],
                        ),
                      ),
                      AnimationClick(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(16)),
                          child: Image.asset(play, width: 24, height: 24),
                        ),
                      )
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    reading_post_detail_2,
                    height: height / 8,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height / 2.5,
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Stack(
              children: [
                BlocBuilder<SliderBloc, int>(
                  builder: (context, state) {
                    return PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      onPageChanged: (value) {
                        if (value > state) {
                          sliderBloc.add(SwipeRight());
                        } else {
                          sliderBloc.add(SwipeLeft());
                        }
                      },
                      itemBuilder: (context, index) {
                        return AnimationClick(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(images[index],
                                  fit: BoxFit.cover,
                                  height: height / 2.5,
                                  width: width),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: BlocBuilder<SliderBloc, int>(
                    builder: (context, state) {
                      return OnBoardingWidget.createIndicator(
                          lengthImage: images.length, currentImage: state);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Decentralized Digital Art Gallery',
                  style: title4(color: grey1100),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    '+0.00004869 BTC',
                    style: body(color: grey1100),
                  ),
                ),
                Text(
                  'Check Out the Digital Art That Is Leaving',
                  style: body(color: grey1100),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 32),
                  child: Text(
                    'Immersive and original artwork created for crypto, future-tech and blockchain investors.',
                    style: body(color: grey1100),
                  ),
                ),
                Text(
                  'Crypto Love Gallery',
                  style: title4(color: grey1100),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'This gallery is a showcase of digital crypto art, using electronic equipment as the medium for arts and non-tangible currency as the theme. ',
                    style: body(color: grey1100),
                  ),
                ),
                Text(
                  'All images are available in limited edition prints for the highest quality possible. Printed wall art is the ideal gift for any crypto or art lover.',
                  style: body(color: grey1100),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: GradientText(
              'Relate Post',
              style: const TextStyle(
                  fontSize: 28,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SpaceGrotesk'),
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            ),
          ),
          SizedBox(
            height: height / 4,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, index) {
                  return AnimationClick(
                    child: Container(
                      width: (width - 12) / 2,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  relatedPosts[index]['image'],
                                  width: (width - 12) / 2,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  relatedPosts[index]['title'],
                                  style: headline(color: grey1100),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      relatedPosts[index]['time'],
                                      style: subhead(color: grey400),
                                    ),
                                    AnimationClick(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Image.asset(
                                          headphone,
                                          width: 16,
                                          height: 16,
                                          color: grey1100,
                                        ),
                                        decoration: BoxDecoration(
                                            color: green,
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 4,
                    ),
                itemCount: relatedPosts.length),
          ),
        ],
      ),
    );
  }
}
