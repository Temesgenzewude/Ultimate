import 'package:flutter/material.dart';

import '../../../../app/widget_support.dart';
import '../../../../common/constant/colors.dart';
import '../../../../common/constant/images.dart';
import '../../../../common/constant/styles.dart';
import '../../../../common/widget/animation_click.dart';

List<String> items = [bgProfile51, bgProfile52, bgProfile53, bgProfile54];

class ProfileFive extends StatefulWidget {
  const ProfileFive({super.key});

  @override
  State<ProfileFive> createState() => _ProfileFiveState();
}

class _ProfileFiveState extends State<ProfileFive>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List<String> tabs = ['My Portfolios', 'Proposals (4)', 'Current Project'];

  Widget tabView(double height, double width) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4),
      itemCount: items.length,
      itemBuilder: (context, index) => AnimationClick(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              items[index],
              fit: BoxFit.fill,
            )),
      ),
    );
  }

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabs.length, vsync: this);
    controller.addListener(() {
      if (!controller.indexIsChanging) {
        setState(() {
          _currentIndex = controller.index;
        });
      }
    });
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
              elevation: 0,
              leading: const SizedBox(),
              leadingWidth: 0,
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              pinned: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimationClick(
                    function: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Image.asset(
                        icArrowLeft,
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
                        gitBranch,
                        width: 24,
                        height: 24,
                        color: grey1100,
                      ),
                    ),
                  )
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(
                            bgProfile5,
                            fit: BoxFit.fill,
                            height: height > 900 ? height / 4 : height / 6,
                            width: width,
                          ),
                          const Positioned(
                            bottom: -40,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundColor: grey100,
                              child: CircleAvatar(
                                  radius: 42,
                                  backgroundImage: AssetImage(
                                    avtFemale,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    Text(
                      'UI/UX Designer',
                      style: body(color: grey800),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 24, bottom: 16, left: 8, right: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                '230K',
                                style: title2(color: grey1100),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Follower',
                                style: subhead(color: grey800),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '108',
                                style: title2(color: grey1100),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Client',
                                style: subhead(color: grey800),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '498',
                                style: title2(color: grey1100),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Project',
                                style: subhead(color: grey800),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              expandedHeight: height / 2,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TabBar(
                    controller: controller,
                    isScrollable: true,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: grey100,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 0,
                    labelStyle: headline(color: grey1100),
                    unselectedLabelStyle: headline(color: grey600),
                    labelColor: grey1100,
                    unselectedLabelColor: grey600,
                    indicatorColor: grey100,
                    tabs: List.generate(
                        tabs.length,
                        (index) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _currentIndex == index ? primary : grey200,
                            ),
                            child: Tab(text: tabs[index]))),
                  ),
                ),
              ),
            )
          ];
        },
        body: TabBarView(controller: controller, children: [
          tabView(height, width),
          tabView(height, width),
          tabView(height, width),
        ]),
      ),
    );
  }
}
