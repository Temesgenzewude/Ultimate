import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, dynamic>> hotToday = [
  <String, dynamic>{
    'image': reading_habit_7,
    'title': 'An Introduction to the Art of the Future',
    'time': '24 mins'
  },
  <String, dynamic>{
    'image': reading_habit_8,
    'title': 'Decentralized Digital Art Gallery',
    'time': '24 mins'
  },
  <String, dynamic>{
    'image': reading_habit_9,
    'title': 'Decentralized Digital Art Gallery',
    'time': '24 mins'
  },
  <String, dynamic>{
    'image': reading_habit_10,
    'title': 'Popular Digital Art by the Neons',
    'time': '24 mins'
  },
  <String, dynamic>{
    'image': reading_interest_1,
    'title': 'View Digital Art Now',
    'time': '24 mins'
  },
  <String, dynamic>{
    'image': reading_habit_7,
    'title': 'Crypto Love Gallery',
    'time': '24 mins'
  },
  <String, dynamic>{
    'image': reading_interest_10,
    'title': 'View Digital Art Now',
    'time': '24 mins'
  },
];

class BookMark2 extends StatefulWidget {
  const BookMark2({Key? key}) : super(key: key);

  @override
  State<BookMark2> createState() => _BookMark2State();
}

class _BookMark2State extends State<BookMark2> {
  int selected = 0;
  List<String> tabs = ['Hot Today (4)', 'Trending (8)', 'Popular (1)'];
  Widget tabView(List<Map<String, dynamic>> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      itemCount: items.length,
      itemBuilder: (context, index) => AnimationClick(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    items[index]['image'],
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                  color: green, borderRadius: BorderRadius.circular(12)),
              child: Text(
                'FREE',
                style: caption1(color: grey1100),
              ),
            ),
            Text(
              items[index]['title'],
              style: headline(color: grey1100),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  items[index]['time'],
                  style: subhead(color: grey400),
                ),
                AnimationClick(
                  child: Image.asset(
                    bookmarks_double,
                    width: 20,
                    height: 20,
                    color: corn1,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  'You have 13 book',
                  style: const TextStyle(
                      fontSize: 32,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
                GradientText(
                  'want to read',
                  style: const TextStyle(
                      fontSize: 32,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
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
          if (selected == 0) ...[tabView(hotToday)],
          if (selected == 1) ...[tabView(hotToday)],
          if (selected == 2) ...[tabView(hotToday)],
        ],
      ),
    );
  }
}
