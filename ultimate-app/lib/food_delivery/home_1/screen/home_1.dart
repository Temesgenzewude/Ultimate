import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/unfocus_click.dart';

List<Map<String, String>> items = [
  {'icon': milkshake, 'title': 'Tea'},
  {'icon': coffee, 'title': 'Coffee'},
  {'icon': chicken_bucket, 'title': 'Chicken'},
  {'icon': ramen, 'title': 'Ramen'},
  {'icon': hot_dog, 'title': 'Hot Dog'},
  {'icon': ice_cream, 'title': 'Ice Cream'},
  {'icon': french_fries_2, 'title': 'Potato'},
  {'icon': french_fries_2, 'title': 'Ice Cream'},
];

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  int selected = 0;
  List<String> tabs = ['Popular', 'Hot Today', 'Near by', 'Favorite'];

  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();

  Widget itemView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24),
      itemCount: items.length,
      itemBuilder: (context, index) => AnimationClick(
        child: Column(
          children: [
            Image.asset(
              items[index]['icon']!,
              width: 56,
              height: 56,
            ),
            const SizedBox(height: 12),
            Text(
              items[index]['title']!,
              style: subhead(color: grey1000),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return UnfocusClick(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 64),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        AnimationClick(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: grey200,
                                borderRadius: BorderRadius.circular(24)),
                            child: Image.asset(
                              map_pin,
                              width: 24,
                              height: 24,
                              color: stPatricksBlue,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '21 Pentrefelin, LL68 9PE',
                          style: headline(color: grey1100),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        AnimationClick(
                          child: Image.asset(
                            icKeyboardRight,
                            width: 24,
                            height: 24,
                            color: grey600,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      AnimationClick(
                        child: Image.asset(
                          envelope_simple,
                          width: 24,
                          height: 24,
                          color: grey1100,
                        ),
                      ),
                      AnimationClick(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Image.asset(
                            bell_simple,
                            width: 24,
                            height: 24,
                            color: grey1100,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFieldCpn(
                controller: searchCtl,
                focusNode: searchFn,
                hintText: 'Find food & drink',
                filled: true,
                fillColor: grey200,
                showPrefixIcon: true,
                prefixIcon: icSearch,
                colorPrefixIcon: grey600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: AnimationClick(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    home_food_1,
                    width: width,
                    height: height / 4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 56,
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
                            horizontal: 24, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: selected == index ? primary : grey200,
                        ),
                        child: Text(
                          tabs[index],
                          style: headline(
                              color: selected == index ? grey1100 : grey600),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                  itemCount: tabs.length),
            ),
            const SizedBox(height: 24),
            if (selected == 0) ...[
              itemView(),
            ],
            if (selected == 1) ...[
              itemView(),
            ],
            if (selected == 2) ...[
              itemView(),
            ],
            if (selected == 3) ...[
              itemView(),
            ],
          ],
        ),
      ),
    );
  }
}
