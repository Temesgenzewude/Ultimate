import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../app/widget_support.dart';
import '../common/route/routes.dart';

final List<Map<String, String>> routers = [
  {'title': 'Feed', 'route': Routes.feed},
  {'title': 'Post Details', 'route': Routes.postDetails},
  {'title': 'Home Social', 'route': Routes.homeSocial},
  {'title': 'Achievements', 'route': Routes.achievements},
  {'title': 'Activity', 'route': Routes.activity},
  {'title': 'Invite Friends', 'route': Routes.inviteFriends},
  {'title': 'List Friends', 'route': Routes.listFriends},
  {'title': 'Comments', 'route': Routes.comments},
  {'title': 'Reviews', 'route': Routes.reviews},
  {'title': 'Vote', 'route': Routes.vote},
  {'title': 'Survey', 'route': Routes.survey},
  {'title': 'Upgrade Premium', 'route': Routes.upgradePremium},
  {'title': 'Friend List', 'route': Routes.friendList},
  {'title': 'Notification', 'route': Routes.notification},
];

class MenuSocialMediaNavigation extends StatefulWidget {
  const MenuSocialMediaNavigation({Key? key}) : super(key: key);

  @override
  State<MenuSocialMediaNavigation> createState() =>
      _MenuSocialMediaNavigationState();
}

class _MenuSocialMediaNavigationState extends State<MenuSocialMediaNavigation> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              logo,
              width: 48,
              height: 48,
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(32),
                      itemBuilder: (context, index) {
                        return AnimationClick(
                          function: () {
                            Navigator.of(context)
                                .pushNamed(routers[index]['route']!);
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                routers[index]['title']!,
                                style: title3(
                                    color: selected == index ? corn1 : grey600),
                              ),
                              selected == index
                                  ? Container(
                                      width: 40,
                                      height: 4,
                                      decoration: BoxDecoration(
                                          color: corn1,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 32),
                      itemCount: routers.length),
                  Positioned(
                      bottom: 16,
                      right: 0,
                      child: Image.asset(
                        menu,
                        height: height / 4,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
