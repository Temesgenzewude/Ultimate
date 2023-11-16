import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';

List<Map<String, String>> inStock = [
  {
    'image': french_fries_2,
    'title': 'Ice Cream Jolibee',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'sale': '🛵️ 38 sales',
    'views': '💸️ 48k view',
    'money': '💸️ \$76'
  },
  {
    'image': chicken_bucket,
    'title': 'Taquito Cheese',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'sale': '🛵️ 38 sales',
    'views': '💸️ 48k view',
    'money': '💸️ \$76'
  },
  {
    'image': hot_dog,
    'title': 'Chalupa Supreme',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'sale': '🛵️ 38 sales',
    'views': '💸️ 48k view',
    'money': '💸️ \$76'
  },
];

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  int selected = 0;
  List<String> tabs = ['In Stock (4)', 'Out of Stock (13)', 'Pending (8)'];

  Widget itemView(List<Map<String, String>> items) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 64),
          itemBuilder: (context, index) {
            return AnimationClick(
              function: () {},
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: grey200,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          items[index]['image']!,
                          width: 56,
                          height: 56,
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index]['title']!,
                                style: headline(color: grey1100),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                items[index]['balance']!,
                                style: title4(color: corn1),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    AppWidget.divider(context, vertical: 16, color: grey300),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          items[index]['sale']!,
                          style: subhead(color: grey800, fontWeight: '400'),
                        ),
                        Text(
                          items[index]['money']!,
                          style: subhead(color: grey800, fontWeight: '400'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          items[index]['views']!,
                          style: subhead(color: grey800, fontWeight: '400'),
                        ),
                        Text(
                          items[index]['star']!,
                          style: subhead(color: grey800, fontWeight: '400'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: AppWidget.typeButtonStartAction2(
                              context: context,
                              input: 'Hide',
                              onPressed: () {},
                              bgColor: grey300,
                              vertical: 8,
                              borderColor: grey300,
                              textColor: grey600),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: AppWidget.typeButtonStartAction2(
                              context: context,
                              input: 'Edit',
                              onPressed: () {},
                              bgColor: grey300,
                              vertical: 8,
                              borderColor: grey300,
                              textColor: grey600),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 4),
          itemCount: items.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
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
                icSearch,
                width: 24,
                height: 24,
                color: corn1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AnimationClick(
                child: Image.asset(
                  chatCircleText,
                  width: 24,
                  height: 24,
                  color: corn1,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AppWidget.typeButtonStartAction2(
            context: context,
            input: 'Add New Product',
            onPressed: () {},
            sizeAsset: 20,
            bgColor: primary,
            icon: plusCircle,
            borderColor: primary,
            textColor: grey1100),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              'Inventory',
              style: header(color: grey1100),
            ),
          ),
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
          if (selected == 0) ...[itemView(inStock)],
          if (selected == 1) ...[itemView(inStock)],
          if (selected == 2) ...[itemView(inStock)],
        ],
      ),
    );
  }
}
