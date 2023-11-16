import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/goal.dart';

List<Map<String, String>> books = [
  {'image': reading_habit_1, 'title': 'A Collection of Classic Laser Neon'},
  {'image': reading_habit_2, 'title': 'Decentralized Digital Art Gallery'},
  {'image': reading_habit_3, 'title': 'Browse Through Unique Digital Art'},
  {'image': reading_habit_4, 'title': 'A Collection of Classic Laser Neon'},
  {'image': reading_habit_5, 'title': 'Decentralized Digital Art Gallery'},
  {'image': reading_habit_6, 'title': 'Browse Through Unique Digital Art'}
];

class ReadingHabit extends StatefulWidget {
  const ReadingHabit({Key? key}) : super(key: key);

  @override
  State<ReadingHabit> createState() => _ReadingHabitState();
}

class _ReadingHabitState extends State<ReadingHabit> {
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                avtFemale,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
        right: Row(
          children: [
            AnimationClick(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(24)),
                child: Image.asset(
                  book,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
            ),
            AnimationClick(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(24)),
                child: Image.asset(
                  icSearch,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  'Reading Habit',
                  style: const TextStyle(
                      fontSize: 40,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
                const Goal(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientText(
                      'Book for you',
                      style: const TextStyle(
                          fontSize: 28,
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
                        style: headline(color: grey1100),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: height / 3,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) => AnimationClick(
                child: Container(
                  width: width / 2.5,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            books[index]['image']!,
                            width: width / 2.5,
                            height: height / 4.2,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        books[index]['title']!,
                        style: headline(color: grey1100),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimationClick(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24), color: grey200),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      reading_habit_13,
                      width: 40,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rich dad - ep01',
                          style: title4(color: grey1100),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '12:40',
                          style: body(color: grey600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  AnimationClick(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        play,
                        width: 24,
                        height: 24,
                      ),
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(16)),
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
