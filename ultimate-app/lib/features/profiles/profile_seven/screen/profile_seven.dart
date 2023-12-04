import 'package:flutter/material.dart';

import '../../../../app/widget_support.dart';
import '../../../../common/constant/colors.dart';
import '../../../../common/constant/images.dart';
import '../../../../common/constant/styles.dart';
import '../../../../common/widget/animation_click.dart';
import '../../../../common/widget/app_bar_cpn.dart';
import '../../../profiles/profile_seven/widget/profile_seven_widget.dart';

List<String> images = [bgProfile72, bgProfile73];

class ProfileSeven extends StatefulWidget {
  const ProfileSeven({super.key});

  @override
  State<ProfileSeven> createState() => _ProfileSevenState();
}

class _ProfileSevenState extends State<ProfileSeven>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _currentIndex = 0;
  Widget tabView(double width) {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
              width: width / 2.4,
              child: index == 0
                  ? AnimationClick(child: ProfileSevenWidget().dotted())
                  : AnimationClick(
                      child: Image.asset(
                        images[index - 1],
                        fit: BoxFit.fill,
                      ),
                    ));
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
        itemCount: images.length + 1);
  }

  @override
  void initState() {
    _controller =
        TabController(length: 3, vsync: this, initialIndex: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
            function: () {
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                size: 32,
                color: grey1100,
              ),
            )),
        right: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              AnimationClick(
                child: Image.asset(
                  vector,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              AnimationClick(
                child: Image.asset(
                  icSearch,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomLeft,
              children: [
                AnimationClick(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: height / 5,
                    width: width,
                    decoration: BoxDecoration(
                      color: grey200,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Image.asset(
                      bgProfile7,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -48,
                  left: 24,
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundColor: grey100,
                        child: CircleAvatar(
                            radius: 42,
                            backgroundImage: AssetImage(
                              avtFemale,
                            )),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 8,
                          child: AnimationClick(
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: primary,
                                  border: Border.all(color: grey1100, width: 2),
                                  borderRadius: BorderRadius.circular(32)),
                              child: Image.asset(
                                camera,
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ]),
          Padding(
            padding: const EdgeInsets.only(top: 64, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Albert Flores',
                  style: title3(color: grey1100),
                ),
                const SizedBox(width: 8),
                Image.asset(checkbox, width: 24, height: 24)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'UI/UX Designer',
              style: body(color: grey800),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  color: grey200,
                  border: Border.all(color: grey200)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: TabBar(
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      controller: _controller,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: primary,
                      ),
                      labelStyle: headline(color: grey1100),
                      unselectedLabelStyle: headline(color: grey600),
                      labelColor: grey1100,
                      unselectedLabelColor: grey600,
                      indicatorColor: primary,
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      tabs: const [
                        Tab(text: 'Videos'),
                        Tab(text: 'Post'),
                        Tab(text: 'Friends'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 64),
                      child: TabBarView(controller: _controller, children: [
                        tabView(width),
                        Container(),
                        Container(),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
