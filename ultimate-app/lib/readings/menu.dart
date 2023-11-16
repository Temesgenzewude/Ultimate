import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../app/widget_support.dart';
import '../common/route/routes.dart';

final List<Map<String, String>> routers = [
  {'title': 'Main Seller 1', 'route': Routes.main_seller_1},
  {'title': 'Interest 1', 'route': Routes.interest_1},
  {'title': 'Main Seller 2', 'route': Routes.main_seller_2},
  {'title': 'Interest 2', 'route': Routes.interest_2},
  {'title': 'Post Details', 'route': Routes.post_details},
  {'title': 'Bookmark 1', 'route': Routes.bookmark_1},
  {'title': 'Bookmark 2', 'route': Routes.bookmark_2},
  {'title': 'Book Detail', 'route': Routes.book_detail},
  {'title': 'Bookmark Listen', 'route': Routes.bookmark_listen},
  {'title': 'Reading Habit', 'route': Routes.reading_habit}
];

class MenuReadingNavigation extends StatefulWidget {
  const MenuReadingNavigation({Key? key}) : super(key: key);

  @override
  State<MenuReadingNavigation> createState() => _MenuReadingNavigationState();
}

class _MenuReadingNavigationState extends State<MenuReadingNavigation> {
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
