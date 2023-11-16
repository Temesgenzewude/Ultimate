import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, dynamic>> cryptos = [
  <String, dynamic>{
    'image': reading_interest_9,
    'title': 'Browse Through Unique Digital',
    'subTitle': 'Author',
    'time': '24 mins read'
  },
  <String, dynamic>{
    'image': reading_habit_5,
    'title': 'A New Era of Art',
    'subTitle': 'Author',
    'time': '24 mins read'
  },
  <String, dynamic>{
    'image': reading_habit_1,
    'title': 'The First Digital Art Gallery With ',
    'subTitle': 'Author',
    'time': '24 mins read'
  },
  <String, dynamic>{
    'image': reading_habit_6,
    'title': 'Crypto Love Gallery',
    'subTitle': 'Author',
    'time': '24 mins read'
  },
  <String, dynamic>{
    'image': reading_interest_1,
    'title': 'View Digital Art Now',
    'subTitle': 'Author',
    'time': '24 mins read'
  },
  <String, dynamic>{
    'image': reading_habit_7,
    'title': 'Crypto Love Gallery',
    'subTitle': 'Author',
    'time': '24 mins read'
  },
  <String, dynamic>{
    'image': reading_interest_10,
    'title': 'View Digital Art Now',
    'subTitle': 'Author',
    'time': '24 mins read'
  },
];

List<Map<String, dynamic>> finance = [
  <String, dynamic>{
    'image': reading_interest_8,
    'title': 'Browse Through Unique Digital',
    'subTitle': 'Author',
    'time': '24 mins read'
  },
  <String, dynamic>{
    'image': reading_habit_6,
    'title': 'A New Era of Art',
    'subTitle': 'Author',
    'time': '24 mins read'
  },
  <String, dynamic>{
    'image': reading_habit_9,
    'title': 'The First Digital Art Gallery With ',
    'subTitle': 'Author',
    'time': '24 mins read'
  },
  <String, dynamic>{
    'image': reading_habit_1,
    'title': 'Crypto Love Gallery',
    'subTitle': 'Author',
    'time': '24 mins read'
  },
  <String, dynamic>{
    'image': reading_interest_3,
    'title': 'View Digital Art Now',
    'subTitle': 'Author',
    'time': '24 mins read'
  },
];

class Bookmark1 extends StatefulWidget {
  const Bookmark1({Key? key}) : super(key: key);

  @override
  State<Bookmark1> createState() => _Bookmark1State();
}

class _Bookmark1State extends State<Bookmark1> {
  int selected = 0;
  List<String> tabs = ['Crypto', 'Finance', 'Business'];
  Widget tabView(List<Map<String, dynamic>> items) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return AnimationClick(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: grey200),
              child: Row(
                children: [
                  Image.asset(
                    items[index]['image'],
                    width: 60,
                    height: 80,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[index]['title'],
                          style: headline(color: grey1100),
                        ),
                        Text(
                          items[index]['subTitle'],
                          style: caption1(color: grey600),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                items[index]['time'],
                                style: caption1(color: grey1100),
                              ),
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
                                    borderRadius: BorderRadius.circular(24)),
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
              height: 8,
            ),
        itemCount: items.length);
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          function: () {
            Navigator.of(context).pop();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              icArrowLeft,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        right: AnimationClick(
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              icSearch,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
      ),
      floatingActionButton: AnimationClick(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: primary),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  reading_habit_13,
                  width: 40,
                  height: 52,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rich dad - ep01',
                    style: title4(color: grey1100),
                  ),
                  Text(
                    '12:40',
                    style: body(color: grey800),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              AnimationClick(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    play,
                    width: 24,
                    height: 24,
                  ),
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(16)),
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GradientText(
              'Bookmark',
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
          ),
          const SizedBox(height: 12),
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
                      width: (width - 40) / 3,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: selected == index ? primary : grey200),
                      child: Center(
                        child: Text(
                          tabs[index],
                          style: subhead(
                              color: selected == index ? grey1100 : grey600,
                              fontWeight: '700'),
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
          const SizedBox(height: 16),
          if (selected == 0) ...[tabView(cryptos)],
          if (selected == 1) ...[tabView(finance)],
          if (selected == 2) ...[tabView(cryptos)]
        ],
      ),
    );
  }
}
