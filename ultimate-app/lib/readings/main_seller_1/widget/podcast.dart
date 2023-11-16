import 'package:flutter/material.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, dynamic>> podcast = [
  <String, dynamic>{
    'image': reading_interest_9,
    'title': 'Decentralized Gallery and Marketplace for Digital Art',
    'time': 'February 29, 2012'
  },
  <String, dynamic>{
    'image': reading_habit_5,
    'title': 'Art of the Future',
    'time': 'February 29, 2012'
  },
  <String, dynamic>{
    'image': reading_habit_1,
    'title': 'The First Digital Art Gallery With',
    'time': 'February 29, 2012'
  },
  <String, dynamic>{
    'image': reading_habit_6,
    'title': 'Crypto Love Gallery',
    'time': 'February 29, 2012'
  },
];

class Podcast extends StatelessWidget {
  const Podcast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GradientText(
                'Podcast',
                style: const TextStyle(
                    fontSize: 22,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SpaceGrotesk'),
                gradient: LinearGradient(colors: [
                  const Color(0xFFCFE1FD).withOpacity(0.9),
                  const Color(0xFFFFFDE1).withOpacity(0.9),
                ]),
              ),
              AnimationClick(
                child: Text(
                  'See All',
                  style: headline(color: primary),
                ),
              )
            ],
          ),
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              return AnimationClick(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), color: grey200),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          podcast[index]['image'],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              podcast[index]['title'],
                              style: headline(color: grey1100),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    podcast[index]['time'],
                                    style: caption1(color: grey600),
                                  ),
                                ),
                                AnimationClick(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      headphone,
                                      width: 16,
                                      height: 16,
                                      color: grey1100,
                                    ),
                                    decoration: BoxDecoration(
                                        color: green,
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
            itemCount: podcast.length)
      ],
    );
  }
}
