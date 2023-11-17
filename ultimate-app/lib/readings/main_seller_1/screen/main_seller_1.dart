import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/podcast.dart';

List<Map<String, dynamic>> hotToday = [
  <String, dynamic>{
    'title': 'Decentralized Digital Art Gallery',
    'time': 'February 29, 2012',
    'tag': 'Crypto',
    'description':
        'Why are Kalshi’s Event contracts generally different from other instruments I’m banned from trading?',
    'image': main_seller_1
  },
  <String, dynamic>{
    'title': 'Discover the Exciting World of Digital Art',
    'time': 'February 29, 2012',
    'tag': 'Crypto',
    'description':
        'Why are Kalshi’s Event contracts generally different from other instruments I’m banned from trading?',
    'image': main_seller_2
  },
];

class MainSeller1 extends StatefulWidget {
  const MainSeller1({Key? key}) : super(key: key);

  @override
  State<MainSeller1> createState() => _MainSeller1State();
}

class _MainSeller1State extends State<MainSeller1> {
  int selected = 0;
  List<String> tabs = ['Hot Today', 'Trending', 'Popular'];

  Widget itemCoin(String icon, String money, String rate, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 18, height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GradientText(
            '\$$money',
            style: const TextStyle(
                fontSize: 18, height: 1.2, fontFamily: 'SpaceGrotesk'),
            gradient: LinearGradient(colors: [
              const Color(0xFFCFE1FD).withOpacity(0.9),
              const Color(0xFFFFFDE1).withOpacity(0.9),
            ]),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(12)),
          child: Text(
            rate,
            style: caption1(color: grey1100),
          ),
        )
      ],
    );
  }

  Widget item(String title, String time, String image) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: headline(color: grey1100),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: caption1(color: grey600),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 80,
              height: 64,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

  Widget tabView(
      List<Map<String, dynamic>> items, double height, double width) {
    return SizedBox(
      height: height / 2.5,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          itemBuilder: (context, index) {
            return AnimationClick(
              child: Container(
                width: width - 24,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            items[index]['image'],
                            width: width - 24,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            items[index]['tag'],
                            style: caption1(color: grey1100),
                          ),
                        ),
                        Text(
                          items[index]['title'],
                          style: headline(color: grey1100),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          items[index]['time'],
                          style: subhead(color: grey400),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          items[index]['description'],
                          style: body(color: grey1100),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 4,
              ),
          itemCount: items.length),
    );
  }

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
        center: Image.asset(logo, width: 40, height: 40),
        right: Row(
          children: [
            AnimationClick(
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
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
            AnimationClick(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    icSearch,
                    width: 28,
                    height: 28,
                    color: grey1100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          AppWidget.divider(context, color: grey200, vertical: 0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: itemCoin(coin1, '5.23', '+0.18%', green)),
                Expanded(child: itemCoin(coin2, '1.46', '+0.1%', green)),
                Expanded(child: itemCoin(coin3, '0.004', '-0.8%', radicalRed1)),
              ],
            ),
          ),
          AppWidget.divider(context, color: grey200, vertical: 0),
          item('An Introduction to the Art of the Future', 'February 29, 2012',
              reading_interest_2),
          const SizedBox(height: 4),
          item('Art Should Be Seen.', 'February 29, 2012', main_seller_2),
          const SizedBox(height: 24),
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
                      child: GradientText(
                        tabs[index],
                        style: const TextStyle(
                            fontSize: 20,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SpaceGrotesk'),
                        gradient: LinearGradient(
                            colors: selected == index
                                ? [
                                    const Color(0xFFCFE1FD).withOpacity(0.9),
                                    const Color(0xFFFFFDE1).withOpacity(0.9),
                                  ]
                                : [
                                    grey1100.withOpacity(0.3),
                                    grey1100.withOpacity(0.3),
                                  ]),
                      ));
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                itemCount: tabs.length),
          ),
          if (selected == 0) ...[tabView(hotToday, height, width)],
          if (selected == 1) ...[tabView(hotToday, height, width)],
          if (selected == 2) ...[tabView(hotToday, height, width)],
          const SizedBox(height: 8),
          const Podcast()
        ],
      ),
    );
  }
}