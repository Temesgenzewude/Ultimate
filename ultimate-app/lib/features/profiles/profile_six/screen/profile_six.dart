import 'package:flutter/material.dart';

import '../../../../app/widget_support.dart';
import '../../../../common/constant/colors.dart';
import '../../../../common/constant/images.dart';
import '../../../../common/constant/styles.dart';
import '../../../../common/widget/animation_click.dart';

List<Map<String, String>> items = [
  {
    'title': 'The wolrd, your life',
    'subTitle': 'June Cook',
    'image': bgProfile61
  },
  {
    'title': 'The wolrd, your life',
    'subTitle': 'June Cook',
    'image': bgProfile72
  },
  {
    'title': 'The wolrd, your life',
    'subTitle': 'June Cook',
    'image': bgProfile62
  },
  {
    'title': 'The wolrd, your life',
    'subTitle': 'June Cook',
    'image': bgProfile61
  },
  {
    'title': 'The wolrd, your life',
    'subTitle': 'June Cook',
    'image': bgProfile72
  },
];

class ProfileSix extends StatefulWidget {
  const ProfileSix({super.key});

  @override
  State<ProfileSix> createState() => _ProfileSixState();
}

class _ProfileSixState extends State<ProfileSix>
    with SingleTickerProviderStateMixin {
  Widget item(double height, double width, String title, String subTitle,
      String image, Function() onTap) {
    return AnimationClick(
      function: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: grey200, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Image.asset(
              image,
              height: height / 8,
              width: 110,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: headline(color: grey1100),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subTitle,
                        style: caption1(color: grey500),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                headphones,
                                width: 16,
                                height: 16,
                                color: corn1,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '48mins',
                                style: caption1(color: grey1100),
                              )
                            ],
                          ),
                          AnimationClick(
                            child: Image.asset(
                              downloadSimple,
                              width: 16,
                              height: 16,
                              color: corn1,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 4,
                            width: width,
                            decoration: BoxDecoration(
                                color: Theme.of(context).color1,
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            height: 4,
                            width: width / 3,
                            curve: Curves.linearToEaseOut,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(4)),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 8)
          ],
        ),
      ),
    );
  }

  Widget tabView(double height, double width) {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        itemBuilder: (context, index) => item(
            height,
            width,
            items[index]['title']!,
            items[index]['subTitle']!,
            items[index]['image']!,
            () {}),
        separatorBuilder: (context, index) => const SizedBox(
              height: 24,
            ),
        itemCount: items.length);
  }

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leadingWidth: 0,
              leading: const SizedBox(),
              backgroundColor: grey200,
              elevation: 0,
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              pinned: true,
              toolbarHeight: 48,
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: headline(color: grey1100),
                      ),
                      Row(
                        children: [
                          AnimationClick(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: Image.asset(
                                airplay,
                                width: 24,
                                height: 24,
                                color: grey1100,
                              ),
                            ),
                          ),
                          AnimationClick(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Image.asset(
                                dotsThreeVertical,
                                width: 24,
                                height: 24,
                                color: grey1100,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              avtFemale,
                            )),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: grey100,
                                  borderRadius: BorderRadius.circular(32)),
                              child: Image.asset(
                                checkbox,
                                width: 24,
                                height: 24,
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        'Albert Flores',
                        style: title3(color: grey1100),
                      ),
                    ),
                    Text(
                      'UI/UX Designer',
                      style: body(color: grey800),
                    ),
                  ],
                ),
              ),
              expandedHeight: height / 3.5,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: controller,
                    isScrollable: true,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: primary,
                    ),
                    labelStyle: headline(color: grey1100),
                    unselectedLabelStyle: headline(color: grey600),
                    labelColor: grey1100,
                    unselectedLabelColor: grey600,
                    indicatorColor: primary,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    tabs: const [
                      Tab(text: 'Reading'),
                      Tab(text: 'Bookmark (4)'),
                      Tab(text: 'Activity'),
                      Tab(text: 'Review'),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: Container(
          color: grey100,
          child: TabBarView(controller: controller, children: [
            tabView(height, width),
            tabView(height, width),
            tabView(height, width),
            tabView(height, width),
          ]),
        ),
      ),
    );
  }
}
