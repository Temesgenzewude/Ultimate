import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, String>> requests = [
  {
    'avt': avtMale2,
    'name': 'Christine Stewart',
    'mutual': '13 mutual friends',
  },
  {
    'avt': avtMale3,
    'name': 'Christine Stewart',
    'mutual': '13 mutual friends',
  },
  {
    'avt': avtMale4,
    'name': 'Christine Stewart',
    'mutual': '13 mutual friends',
  },
  {
    'avt': avtMale5,
    'name': 'Christine Stewart',
    'mutual': '13 mutual friends',
  },
  {
    'avt': avtMale2,
    'name': 'Christine Stewart',
    'mutual': '13 mutual friends',
  }
];

List<Map<String, String>> friends = [
  {
    'avt': avtMale6,
    'name': 'Christine Stewart',
    'last_message': 'Hello! Are you there',
  },
  {
    'avt': avtMale7,
    'name': 'Christine Stewart',
    'last_message': 'This is darkmode app',
  },
  {
    'avt': avtMale8,
    'name': 'Christine Stewart',
    'last_message': '1000+ Screens',
  },
  {
    'avt': avtMale9,
    'name': 'Christine Stewart',
    'last_message': 'React Native & Flutter version',
  },
  {
    'avt': avtMale10,
    'name': 'Christine Stewart',
    'last_message': 'React Native & Flutter version',
  },
  {
    'avt': avtMale5,
    'name': 'Christine Stewart',
    'last_message': 'React Native & Flutter version',
  },
  {
    'avt': avtMale4,
    'name': 'Christine Stewart',
    'last_message': 'React Native & Flutter version',
  }
];

class ListFriends extends StatelessWidget {
  const ListFriends({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(
          context: context, hasLeading: true, hasPop: true, title: 'Friends'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  '${requests.length} Request',
                  style: const TextStyle(
                      fontSize: 28,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
                AnimationClick(
                    child: Image.asset(
                  icArrowRight,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ))
              ],
            ),
          ),
          SizedBox(
            height: height / 3.5,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: requests.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) => AnimationClick(
                child: Container(
                  width: width / 2.8,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      color: grey200, borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Image.asset(
                          requests[index]['avt']!,
                          width: 56,
                          height: 56,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        requests[index]['name']!,
                        textAlign: TextAlign.center,
                        style: headline(color: grey1100),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        requests[index]['mutual']!,
                        textAlign: TextAlign.center,
                        style: subhead(color: grey800),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AnimationClick(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: radicalRed1,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Icon(
                                Icons.close,
                                size: 24,
                                color: grey1100,
                              ),
                            ),
                          ),
                          AnimationClick(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Icon(
                                Icons.check,
                                size: 24,
                                color: grey1100,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  '${friends.length} Friends',
                  style: const TextStyle(
                      fontSize: 28,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
                AnimationClick(
                    child: Image.asset(
                  icArrowRight,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ))
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 0),
            itemCount: friends.length,
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemBuilder: (context, index) => AnimationClick(
              child: Container(
                width: width,
                padding: const EdgeInsets.all(24),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage(
                              friends[index]['avt']!,
                            )),
                        Positioned(
                            bottom: 2,
                            right: 0,
                            child: Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: grey1100,
                                  borderRadius: BorderRadius.circular(32)),
                              child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(32))),
                            ))
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  friends[index]['name']!,
                                  style: headline(color: grey1100),
                                ),
                              ),
                              AnimationClick(
                                  child: Image.asset(
                                dotsThreeVertical,
                                width: 24,
                                height: 24,
                                color: grey600,
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            friends[index]['last_message']!,
                            style: subhead(color: grey400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
