import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';

class HomeSocial extends StatefulWidget {
  const HomeSocial({super.key});

  @override
  State<HomeSocial> createState() => _HomeSocialState();
}

class _HomeSocialState extends State<HomeSocial>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int _currentIndex = 0;
  List<String> tabs = ['Hot Today', 'Newest', 'For You', 'Trending'];
  List<Map<String, dynamic>> items = [
    <String, dynamic>{
      'number': 3,
      'title': 'Posts Save',
      'subTitle': 'Conversion Rate Optimisation',
      'bgColor': green,
      'image': bgOb1
    },
    <String, dynamic>{
      'number': 6,
      'title': 'Tutorial',
      'subTitle': 'Conversion Rate Optimisation',
      'bgColor': primary,
      'image': bgOb12
    }
  ];
  List<Map<String, String>> images = [
    {'image': feedStory1, 'avt': avtMale8},
    {'image': feedStory2, 'avt': avtMale9},
    {'image': feedStory3, 'avt': avtMale10},
    {'image': feedStory1, 'avt': avtMale7},
    {'image': feedStory2, 'avt': avtMale6},
    {'image': feedStory3, 'avt': avtMale5}
  ];
  Widget itemView(double width) {
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return AnimationClick(
            child: Container(
              width: width / 1.3,
              decoration: BoxDecoration(
                  color: grey200, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              items[index]['number'].toString(),
                              style: title2(color: corn1),
                            ),
                            AnimationClick(
                              child: Image.asset(
                                uploadSimple,
                                width: 24,
                                height: 24,
                                color: grey1100,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            items[index]['title'],
                            style: title3(color: grey1100),
                          ),
                        ),
                        Text(
                          items[index]['subTitle'],
                          style: body(color: grey1100),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: LayoutBuilder(builder: (context, size) {
                      return Stack(
                        alignment: Alignment.bottomCenter,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: size.maxHeight / 2,
                            width: size.maxWidth,
                            decoration: BoxDecoration(
                                color: items[index]['bgColor'],
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          Positioned(
                              left: 0,
                              right: 0,
                              bottom: 24,
                              child: Image.asset(
                                items[index]['image'],
                                height: size.maxHeight / 1.2,
                              ))
                        ],
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: items.length);
  }

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
      appBar: AppBarCpn(
        color: grey200,
        left: AnimationClick(
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            child: Image.asset(
              envelopeSimple,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        center: Text(
          'Home Social',
          style: title4(color: grey1100),
        ),
        right: AnimationClick(
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            child: Image.asset(
              gearSix,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          TabBar(
            controller: controller,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: primary,
            ),
            labelStyle: headline(color: grey1100),
            unselectedLabelStyle: headline(color: grey600),
            labelColor: grey1100,
            unselectedLabelColor: grey600,
            indicatorColor: primary,
            tabs: List.generate(
              tabs.length,
              (index) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: _currentIndex == index ? primary : grey200,
                  ),
                  child: Text(tabs[index])),
            ),
          ),
          SizedBox(
            height: height / 5,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 16, top: 24, bottom: 16),
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) => AnimationClick(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(16)),
                        child: Image.asset(
                          images[index]['image']!,
                          width: width / 3.5,
                          height: height / 5,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                          bottom: 8,
                          left: 8,
                          child: AnimationClick(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(color: grey1100)),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage(images[index]['avt']!),
                                radius: 16,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(controller: controller, children: [
              itemView(width),
              itemView(width),
              itemView(width),
              itemView(width),
            ]),
          ),
        ],
      ),
    );
  }
}
