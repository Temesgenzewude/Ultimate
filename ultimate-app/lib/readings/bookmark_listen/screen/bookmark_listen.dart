import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../widget/progress_bar.dart';
import '../widget/second_page.dart';

class BookmarkListen extends StatelessWidget {
  const BookmarkListen({Key? key}) : super(key: key);

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
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              icArrowLeft,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        right: Row(
          children: [
            AnimationClick(
              child: Image.asset(
                bookmark_simple,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AnimationClick(
                child: Image.asset(
                  dots_three_vertical,
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
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            reading_habit_12,
                            height: height / 2.5,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                              child: AnimationClick(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: green,
                                  borderRadius: BorderRadius.circular(99)),
                              child: Image.asset(play, width: 32, height: 32),
                            ),
                          ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32, bottom: 8),
                      child: Hero(
                        tag: 'title',
                        child: Text(
                          "Are You There, God? It's Me, Margaret",
                          textAlign: TextAlign.center,
                          style: title2(color: grey1100),
                        ),
                      ),
                    ),
                    Text(
                      'Chapter 02',
                      style: subhead(color: grey600),
                    )
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimationClick(
                      child: Image.asset(
                        skip_back,
                        width: 24,
                        height: 24,
                        color: grey800,
                      ),
                    ),
                    AnimationClick(
                      child: Image.asset(
                        repeat,
                        width: 24,
                        height: 24,
                        color: grey800,
                      ),
                    ),
                    AnimationClick(
                      child: Image.asset(
                        shuffle_angular,
                        width: 24,
                        height: 24,
                        color: grey800,
                      ),
                    ),
                    AnimationClick(
                      child: Image.asset(
                        skip_forward,
                        width: 24,
                        height: 24,
                        color: grey800,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ProgressBar(width: width * 0.6),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '12:02',
                      style: subhead(color: grey1100),
                    ),
                    Text(
                      '35:46',
                      style: subhead(color: grey1100),
                    )
                  ],
                )
              ],
            ),
          ),
          AnimationClick(
            function: () {
              Navigator.of(context).push<dynamic>(SecondPageRoute());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: grey200, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: grey600,
                    size: 32,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Hero(
                    tag: 'subTitle',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Check Out the Digital Art That Is Leaving',
                          style: body(color: grey900),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Immersive and original artwork created for crypto, future-tech and blockchain investors.',
                          style: body(color: grey900),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'All images are available in limited edition prints for the highest quality possible. Printed wall art is the ideal gift for any crypto or art lover.',
                          style: body(color: grey900),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
