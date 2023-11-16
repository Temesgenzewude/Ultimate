import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';

List<Map<String, dynamic>> items = [
  <String, dynamic>{
    'title': 'Decentralized Digital Art Gallery',
    'subTitle': 'Check Out the Digital Art That Is Leaving',
    'avt': avtFemale,
    'name': 'Albert Flores',
    'time': 'Jul 9, 2023 - 13  mins read',
    'bg': grey200
  },
  <String, dynamic>{
    'title': 'Decentralized Digital Art Gallery',
    'subTitle': 'Check Out the Digital Art That Is Leaving',
    'avt': avtFemale,
    'name': 'Albert Flores',
    'time': 'Jul 9, 2023 - 13  mins read',
    'bg': primary
  }
];

class Interest2 extends StatelessWidget {
  const Interest2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                reading_interest_10,
                height: height / 1.2,
                width: width,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Positioned(
              top: 64,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimationClick(
                    function: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(24)),
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        icArrowLeft,
                        width: 24,
                        height: 24,
                        color: grey1100,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      AnimationClick(
                        child: Container(
                          decoration: BoxDecoration(
                              color: grey200,
                              borderRadius: BorderRadius.circular(24)),
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            book,
                            width: 24,
                            height: 24,
                            color: grey1100,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      AnimationClick(
                        child: Container(
                          decoration: BoxDecoration(
                              color: grey200,
                              borderRadius: BorderRadius.circular(24)),
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            icSearch,
                            width: 24,
                            height: 24,
                            color: grey1100,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
          Positioned(
            bottom: 48,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 200,
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) => Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    AnimationClick(
                      child: Container(
                        width: width - 32,
                        height: 180,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                            color: items[index]['bg'],
                            borderRadius: BorderRadius.circular(24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index]['title'],
                              style: title4(color: grey1100),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              items[index]['subTitle'],
                              style: body(color: grey1100),
                            ),
                            const Expanded(child: SizedBox()),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.asset(
                                    items[index]['avt'],
                                    width: 16,
                                    height: 16,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  items[index]['name'],
                                  style: title4(color: grey900),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              items[index]['time'],
                              style: body(color: grey800),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 24,
                        child: AnimationClick(
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Image.asset(
                                play,
                                width: 24,
                                height: 24,
                              )),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
