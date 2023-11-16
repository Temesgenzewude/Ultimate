import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../app/widget_support.dart';
import '../common/route/routes.dart';

final List<Map<String, String>> routers = [
  {'title': 'Home1', 'route': Routes.home1},
  {'title': 'Home2', 'route': Routes.home2},
  {'title': 'Food Detail', 'route': Routes.food_detail},
  {'title': 'My Order', 'route': Routes.my_order},
  {'title': 'Nearby Me', 'route': Routes.nearby_me},
  {'title': 'Order Success', 'route': Routes.order_success},
  {'title': 'Restaurant Detail', 'route': Routes.restaurant_detail},
  {'title': 'What To Eat Now', 'route': Routes.eat_now},
  {'title': 'Today Food', 'route': Routes.today_food},
  {'title': 'Tracking Order', 'route': Routes.tracking_order}
];

class MenuFoodDeliveryNavigation extends StatefulWidget {
  const MenuFoodDeliveryNavigation({Key? key}) : super(key: key);

  @override
  State<MenuFoodDeliveryNavigation> createState() =>
      _MenuSocialMediaNavigationState();
}

class _MenuSocialMediaNavigationState
    extends State<MenuFoodDeliveryNavigation> {
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
