import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/item.dart';

List<Map<String, dynamic>> hotposts = [
  <String, dynamic>{
    'title': 'A Collection of Classic Laser Neon Art',
    'time': 'February 29, 2012',
    'tag': 'Crypto',
    'image': reading_interest_4
  },
  <String, dynamic>{
    'title': 'Discover the Exciting World of Digital Art',
    'time': 'February 29, 2012',
    'tag': 'Crypto',
    'image': reading_interest_3
  },
  <String, dynamic>{
    'title': 'A Collection of Classic Laser Neon Art',
    'time': 'February 29, 2012',
    'tag': 'Crypto',
    'image': reading_interest_6
  },
  <String, dynamic>{
    'title': 'Discover the Exciting World of Digital Art',
    'time': 'February 29, 2012',
    'tag': 'Crypto',
    'image': reading_interest_7
  },
];

class MainSeller2 extends StatefulWidget {
  const MainSeller2({Key? key}) : super(key: key);

  @override
  State<MainSeller2> createState() => _MainSeller2State();
}

class _MainSeller2State extends State<MainSeller2> {
  int selected = 0;
  List<Map<String, dynamic>> tabs = [
    <String, dynamic>{'title': 'Crypto', 'bg': primary, 'color': grey1100},
    <String, dynamic>{'title': 'Finance', 'bg': green, 'color': grey1100},
    <String, dynamic>{
      'title': 'Business',
      'bg': stPatricksBlue,
      'color': grey1100
    },
    <String, dynamic>{'title': 'Game Fi', 'bg': emerald1, 'color': grey1100},
    <String, dynamic>{'title': 'NFT', 'bg': corn1, 'color': grey100},
    <String, dynamic>{'title': 'Minted', 'bg': lightSalmon, 'color': grey1100},
  ];
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                equals,
                width: 28,
                height: 28,
                color: grey1100,
              ),
            ),
          ),
        ),
        right: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                bookmark_simple,
                width: 28,
                height: 28,
                color: grey1100,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: GradientText(
              'Explore',
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
            height: 48,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return AnimationClick(
                    function: () {
                      setState(() {
                        selected = index;
                      });
                    },
                    child: Container(
                      width: (width - 40) / 4,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: tabs[index]['bg'],
                      ),
                      child: Center(
                        child: Text(
                          tabs[index]['title'],
                          style: caption1(color: tabs[index]['color']),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 4,
                    ),
                itemCount: tabs.length),
          ),
          const ItemPost(
            items: [
              <String, dynamic>{
                'bgImage': reading_post_detail_1,
                'title': 'Decentralized Digital Art Gallery',
                'time': 'February 29, 2012'
              },
              <String, dynamic>{
                'bgImage': reading_habit_5,
                'title': 'Decentralized Digital Art Gallery',
                'time': 'February 29, 2012'
              },
              <String, dynamic>{
                'bgImage': reading_interest_4,
                'title': 'Decentralized Digital Art Gallery',
                'time': 'February 29, 2012'
              }
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  'Hot Post',
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
                AnimationClick(
                  child: Text(
                    'See All',
                    style: headline(color: primary),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height / 3,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, index) {
                  return AnimationClick(
                    child: Container(
                      width: (width - 12) / 2,
                      padding: const EdgeInsets.all(8),
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
                                  hotposts[index]['image'],
                                  width: (width - 12) / 2,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 12),
                                      decoration: BoxDecoration(
                                          color: primary,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Text(
                                        hotposts[index]['tag'],
                                        style: caption1(color: grey1100),
                                      ),
                                    ),
                                    AnimationClick(
                                      child: Image.asset(
                                        bookmarks_double,
                                        width: 20,
                                        height: 20,
                                        color: grey600,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  hotposts[index]['title'],
                                  style: headline(color: grey1100),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  hotposts[index]['time'],
                                  style: subhead(color: grey400),
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
                itemCount: hotposts.length),
          ),
          const SizedBox(
            height: 64,
          )
        ],
      ),
    );
  }
}
