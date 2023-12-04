import 'package:flutter/material.dart';

import '../../../../app/widget_support.dart';
import '../../../../common/constant/colors.dart';
import '../../../../common/constant/images.dart';
import '../../../../common/constant/styles.dart';
import '../../../../common/widget/animation_click.dart';
import '../../../../common/widget/app_bar_cpn.dart';

List<String> badges = [trophy1, trophy2, trophy3, trophy4, trophy5];
List<Map<String, dynamic>> static = [
  <String, dynamic>{
    'icon': icShopping,
    'title': 'Streak',
    'subTitle': '5 Turn'
  },
  <String, dynamic>{
    'icon': icEducation,
    'title': 'Collection',
    'subTitle': '13 Base'
  },
  <String, dynamic>{'icon': icFood, 'title': 'Drink', 'subTitle': '108 cups'},
  <String, dynamic>{
    'icon': icEntertainment,
    'title': 'Music',
    'subTitle': '24 songs'
  }
];

class ProfileFour extends StatelessWidget {
  const ProfileFour({super.key});

  Widget item(String icon, String title, String subTitle) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(icon, width: 56, height: 56),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: title4(color: grey1100),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                subTitle,
                style: body(color: grey800),
              ),
            ],
          )
        ],
      ),
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
              dotsThreeVertical,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        center: Text(
          'Profile',
          style: headline(color: grey1100),
        ),
        right: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Image.asset(
              gearSix,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
      ),
      body: ListView(children: [
        Container(
          margin: const EdgeInsets.only(top: 24, left: 8, right: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Albert Flores',
                        style: title3(color: grey1100),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'UI/UX Designer',
                        style: body(color: grey800),
                      )
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            avtFemale,
                          )),
                      Positioned(
                          bottom: 2,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: grey1100,
                                borderRadius: BorderRadius.circular(32)),
                            child: Image.asset(
                              checkbox,
                              width: 24,
                              height: 24,
                            ),
                          ))
                    ],
                  )
                ],
              ),
              AppWidget.divider(context, color: grey1100.withOpacity(0.1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          '230K',
                          style: title4(color: grey1100),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Following',
                          style: subhead(color: grey800, fontWeight: '400'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          '230K',
                          style: title4(color: grey1100),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Follower',
                          style: subhead(color: grey800, fontWeight: '400'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: AppWidget.typeButtonStartAction2(
                        context: context,
                        input: 'Follow',
                        onPressed: () {},
                        icon: addUser,
                        sizeAsset: 24,
                        colorAsset: primary,
                        bgColor: corn1,
                        borderColor: corn1,
                        textColor: primary),
                  ),
                  AnimationClick(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: grey1100),
                          borderRadius: BorderRadius.circular(16)),
                      child: Image.asset(
                        briefcase,
                        color: grey1100,
                        width: 24,
                        height: 24,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 40, bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Image.asset(giphy, width: 32, height: 32),
              ),
              Text(
                'Statistics',
                style: title4(color: grey1100),
              )
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
          itemCount: static.length,
          itemBuilder: (context, index) => AnimationClick(
            child: item(static[index]['icon']!, static[index]['title']!,
                static[index]['subTitle']),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(trophy1, width: 28, height: 28),
              const SizedBox(width: 8),
              Text(
                'Achievement Badge',
                style: title4(color: grey1100),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 32),
          child: SizedBox(
            height: 80,
            child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => AnimationClick(
                      child: Container(
                        width: 80,
                        height: 80,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: grey200,
                            borderRadius: BorderRadius.circular(48)),
                        child: Image.asset(
                          badges[index],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 16,
                    ),
                itemCount: badges.length),
          ),
        ),
      ]),
    );
  }
}
