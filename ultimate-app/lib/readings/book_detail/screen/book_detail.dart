import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 24, right: 16),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: Row(
            children: [
              Expanded(
                  child: AppWidget.typeButtonStartAction2(
                      context: context,
                      input: 'Listening',
                      onPressed: () {},
                      icon: headphone,
                      bgColor: grey200,
                      borderColor: grey200,
                      textColor: grey1100)),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: AppWidget.typeButtonStartAction2(
                      context: context,
                      input: 'Reading',
                      onPressed: () {},
                      bgColor: primary,
                      icon: eye_glasses,
                      borderColor: primary,
                      textColor: grey1100))
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        reading_habit_11,
                        height: height / 3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                    color: green, borderRadius: BorderRadius.circular(12)),
                child: Text(
                  'FREE BOOK',
                  style: caption1(color: grey1100),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Are You There, God? It's Me, Margaret",
                  style: title4(color: grey1100),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      avtFemale,
                      width: 16,
                      height: 16,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Albert Flores',
                    style: subhead(color: grey900),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '🛵️ 10kms',
                    style: subhead(color: grey600),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      '⭐️ 4/5',
                      style: subhead(color: grey600),
                    ),
                  ),
                  Text(
                    '⏰️ 24 mins read',
                    style: subhead(color: grey600),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 24),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Introduce',
                  style: title3(color: grey1100),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '+0.00004869 BTC',
                  style: body(color: grey900),
                ),
                const SizedBox(
                  height: 8,
                ),
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
          )
        ],
      ),
    );
  }
}
