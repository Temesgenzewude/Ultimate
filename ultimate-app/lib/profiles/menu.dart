import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../app/widget_support.dart';
import '../common/route/routes.dart';

final List<String> routers = [
  Routes.profile1,
  Routes.profile2,
  Routes.profile3,
  Routes.profile4,
  Routes.profile5,
  Routes.profile6,
  Routes.profile7,
  Routes.profile8,
  Routes.profile9,
  Routes.profile10,
  Routes.profile11,
  Routes.profile12,
];

class MenuProfileNavigation extends StatefulWidget {
  const MenuProfileNavigation({Key? key}) : super(key: key);

  @override
  State<MenuProfileNavigation> createState() => _MenuProfileNavigationState();
}

class _MenuProfileNavigationState extends State<MenuProfileNavigation> {
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
                            Navigator.of(context).pushNamed(routers[index]);
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Profile ${index + 1}',
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
