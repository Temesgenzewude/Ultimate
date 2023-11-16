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
    'distance': '🛵️ 10kms',
    'image': hot_dog
  },
  {
    'title': 'Taquito Cheese',
    'balance': '\$8.99',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'image': chicken_bucket
  },
  {
    'title': 'Chalupa Supreme',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'image': french_fries_2
  },
  {
    'title': 'Chalupa Supreme',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'image': french_fries_2
  },
];

List<Map<String, String>> popular = [
  {
    'title': 'Chalupa Supreme',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'image': french_fries_2
  },
  {
    'title': 'Taquito Cheese',
    'balance': '\$8.99',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'image': chicken_bucket
  },
  {
    'title': 'Chalupa Supreme',
    'balance': '\$5.22',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'image': hot_dog
  },
  {
    'title': 'Chalupa Supreme',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'image': french_fries_2
  },
];

class RestaurantDetail extends StatefulWidget {
  const RestaurantDetail({Key? key}) : super(key: key);

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  List<String> tabs = ['For you', 'Popular', 'Newest'];
  int selected = 0;
  bool isClaim = false;
  Widget itemView(List<Map<String, String>> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8),
      itemCount: items.length,
      itemBuilder: (context, index) => AnimationClick(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
              color: grey200, borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  items[index]['image']!,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
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
                        style: subhead(color: grey800),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          items[index]['distance']!,
                          style: subhead(color: grey800),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: height / 3,
                width: width,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16))),
                child: Image.asset(
                  resstaurant_detail_bg,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 64,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimationClick(
                      function: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: grey200,
                            borderRadius: BorderRadius.circular(24)),
                        child: Image.asset(
                          icArrowLeft,
                          width: 24,
                          height: 24,
                          color: grey1100,
                        ),
                      ),
                    ),
                    AnimationClick(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        heart,
                        width: 40,
                        height: 40,
                      ),
                    ))
                  ],
                ),
              ),
              Positioned(
                bottom: -48,
                left: 4,
                right: 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(24)),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Wisconsin Cheese Curds',
                        style: title3(color: grey1100),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              globe_simple,
                              width: 24,
                              height: 24,
                              color: grey1100,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '2715 Ash Dr. San Jose, South Dakota 83475',
                              style: subhead(color: grey900),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '🛵️ 10kms',
                            style: headline(color: grey1100),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              '⭐️ 4/5',
                              style: headline(color: grey1100),
                            ),
                          ),
                          Text(
                            '⏰️ 15-20 minitues',
                            style: headline(color: grey1100),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 64),
          isClaim
              ? const SizedBox()
              : Container(
                  decoration: BoxDecoration(
                      color: corn1, borderRadius: BorderRadius.circular(16)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  margin:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Voucher up to \$3',
                          style: callout(color: grey100, fontWeight: '700'),
                        ),
                      ),
                      AnimationClick(
                        function: () {
                          setState(() {
                            isClaim = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            'Claim',
                            style: headline(color: grey1100),
                          ),
                        ),
                      )
                    ],
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
          if (selected == 0) ...[itemView(forUser)],
          if (selected == 1) ...[itemView(popular)],
          if (selected == 2) ...[itemView(forUser)]
        ],
      ),
    );
  }
}
