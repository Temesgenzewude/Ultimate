import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';

List<Map<String, String>> items = [
  {
    'title': 'White Castle Sliders',
    'balance': '\$11.70',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'time': '⏰️ 15 mins',
    'image': image_food_1
  },
  {
    'title': 'French Fries',
    'balance': '\$6.48',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'time': '⏰️ 15 mins',
    'image': image_food_2
  },
  {
    'title': 'Chalupa Supreme',
    'balance': '\$5.22',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'time': '⏰️ 15 mins',
    'image': image_food_3
  },
  {
    'title': 'Kung Pao Chicken',
    'balance': '\$8.99',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'time': '⏰️ 15 mins',
    'image': image_food_4
  },
  {
    'title': 'Crispy Chicken',
    'balance': '\$14.81',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'time': '⏰️ 15 mins',
    'image': image_food_5
  },
  {
    'title': 'White Castle Sliders',
    'balance': '\$11.70',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'time': '⏰️ 15 mins',
    'image': image_food_1
  },
  {
    'title': 'French Fries',
    'balance': '\$6.48',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'time': '⏰️ 15 mins',
    'image': image_food_2
  },
  {
    'title': 'Chalupa Supreme',
    'balance': '\$5.22',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'time': '⏰️ 15 mins',
    'image': image_food_3
  },
];

class NearbyMe extends StatefulWidget {
  const NearbyMe({Key? key}) : super(key: key);

  @override
  State<NearbyMe> createState() => _NearbyMeState();
}

class _NearbyMeState extends State<NearbyMe>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int _currentIndex = 0;
  List<String> tabs = ['Popular', 'Promo', 'Price low to high', 'Favorite'];

  Widget itemView() {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 4, top: 16, right: 4, bottom: 16),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 4),
      itemBuilder: (context, index) => AnimationClick(
        child: Container(
          decoration: BoxDecoration(
            color: grey200,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      items[index]['title']!,
                      style: title4(color: grey1100),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        items[index]['balance']!,
                        style: title4(color: corn1),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          items[index]['star']!,
                          style: headline(color: grey1100),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            items[index]['distance']!,
                            style: headline(color: grey1100),
                          ),
                        ),
                        Text(
                          items[index]['time']!,
                          style: headline(color: grey1100),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child:
                    Image.asset(items[index]['image']!, width: 80, height: 80),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabs.length, vsync: this);
    controller.addListener(() {
      if (!controller.indexIsChanging) {
        setState(() {
          _currentIndex = controller.index;
        });
      }
    });
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
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              icArrowLeft,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        center: Text(
          'Near Me',
          style: title4(color: grey1100),
        ),
        right: Row(
          children: [
            AnimationClick(
              child: Image.asset(
                filter,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
            AnimationClick(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  icSearch,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimationClick(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: stPatricksBlue,
                  borderRadius: BorderRadius.circular(99)),
              child: Image.asset(ic_shopping, width: 36, height: 36),
            ),
            Positioned(
                right: 4,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(24)),
                  child: Text(
                    '3',
                    style: subhead(color: grey1100),
                  ),
                ))
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          TabBar(
            controller: controller,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: primary,
            ),
            labelStyle: headline(color: grey1100),
            unselectedLabelStyle: headline(color: grey600),
            labelColor: grey1100,
            unselectedLabelColor: grey600,
            indicatorColor: primary,
            tabs: List.generate(
              tabs.length,
              (index) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: _currentIndex == index ? primary : grey200,
                  ),
                  child: Text(tabs[index])),
            ),
          ),
          Expanded(
            child: TabBarView(controller: controller, children: [
              itemView(),
              itemView(),
              itemView(),
              itemView(),
            ]),
          ),
        ],
      ),
    );
  }
}
