import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';

List<Map<String, String>> forUser = [
  {
    'title': 'Chalupa Supreme',
    'balance': '\$5.22',
    'star': '⭐️ 4/5',
    'image': shoe_2
  },
  {
    'title': 'Taquito Cheese',
    'balance': '\$8.99',
    'star': '⭐️ 4/5',
    'image': glove
  },
];
List<Map<String, String>> recommend = [
  {
    'title': 'Chalupa Supreme',
    'balance': '\$5.22',
    'star': '⭐️ 4/5',
    'image': shoes
  },
  {
    'title': 'Taquito Cheese',
    'balance': '\$8.99',
    'star': '⭐️ 4/5',
    'image': shoe_2
  },
];

class TabBarCustom extends StatefulWidget {
  const TabBarCustom({Key? key}) : super(key: key);

  @override
  State<TabBarCustom> createState() => _TabBarCustomState();
}

class _TabBarCustomState extends State<TabBarCustom> {
  int selected = 0;
  List<String> tabs = ['May you like it', 'Recommend', 'Newest'];
  Widget itemView(
      double height, double width, List<Map<String, String>> items) {
    return SizedBox(
      height: height / 3.5,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (context, index) => AnimationClick(
                child: SizedBox(
                    width: width / 2, child: itemPopular(items[index])),
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemCount: items.length),
    );
  }

  Widget itemPopular(Map<String, String> item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(item['image']!)),
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['title']!,
                style: headline(color: grey1100),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['balance']!,
                      style: title4(color: corn1),
                    ),
                    Text(
                      item['star']!,
                      style: subhead(color: grey800),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 48,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                return AnimationClick(
                  function: () {
                    setState(() {
                      selected = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: selected == index
                          ? LinearGradient(colors: [
                              const Color(0xFFCFE1FD).withOpacity(0.9),
                              const Color(0xFFFFFDE1).withOpacity(0.9),
                            ])
                          : null,
                    ),
                    child: Text(
                      tabs[index],
                      style: headline(
                          color: selected == index ? grey100 : grey600),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 8,
                  ),
              itemCount: tabs.length),
        ),
        const SizedBox(height: 16),
        if (selected == 0) ...[itemView(height, width, forUser)],
        if (selected == 1) ...[itemView(height, width, recommend)],
        if (selected == 2) ...[itemView(height, width, forUser)],
        const SizedBox(height: 24),
      ],
    );
  }
}
