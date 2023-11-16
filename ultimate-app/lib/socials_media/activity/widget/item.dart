import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';

class ItemActivity extends StatelessWidget {
  const ItemActivity({super.key, required this.item});
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimationClick(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: Image.asset(item['avt'], width: 48, height: 48),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              item['name'],
                              style: headline(color: grey1100),
                            ),
                            const SizedBox(width: 4),
                            Image.asset(checkbox, width: 24, height: 24)
                          ],
                        ),
                        AnimationClick(
                          child: Image.asset(
                            dotsThreeVertical,
                            width: 24,
                            height: 24,
                            color: grey600,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      item['subTitle'],
                      style: subhead(color: grey800),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: height / 2.5,
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: width / 6, top: 16, bottom: 16),
            itemCount: item['subItems'].length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) => AnimationClick(
              child: Container(
                width: width / 1.5,
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(16)),
                            child: Image.asset(
                              item['subItems'][index]['image'],
                              width: width / 1.5,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                              bottom: -16,
                              left: 24,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(99),
                                    border: Border.all(
                                      color: grey100,
                                      width: 2,
                                    )),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(99),
                                    child: Image.asset(
                                      item['subItems'][index]['avt'],
                                      width: 56,
                                      height: 56,
                                    )),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: height / 30, bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['subItems'][index]['name'],
                            style: title4(color: grey1100),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['subItems'][index]['subTitle'],
                            style: subhead(color: grey800),
                          ),
                          const SizedBox(height: 16),
                          AppWidget.typeButtonStartAction(
                              context: context,
                              input: 'Follow',
                              bgColor: primary,
                              borderColor: primary,
                              textColor: grey1100,
                              borderRadius: 16,
                              onPressed: () {})
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
