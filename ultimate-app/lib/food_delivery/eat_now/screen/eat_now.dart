import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../../tracking_order/widget/button_swipe.dart';
import '../widget/for_you.dart';
import '../widget/yesterday.dart';

class EatNow extends StatefulWidget {
  const EatNow({Key? key}) : super(key: key);

  @override
  State<EatNow> createState() => _EatNowState();
}

class _EatNowState extends State<EatNow> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  AnimationClick(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(24)),
                      child: Image.asset(
                        map_pin,
                        width: 24,
                        height: 24,
                        color: stPatricksBlue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '21 Pentrefelin, LL68 9PE',
                    style: headline(color: grey1100),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  AnimationClick(
                    child: Image.asset(
                      icKeyboardRight,
                      width: 24,
                      height: 24,
                      color: grey600,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        right: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: AnimationClick(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              avt_female,
              width: 32,
              height: 32,
            ),
          )),
        ),
      ),
      floatingActionButton: SizedBox(
        width: width / 1.5,
        child: SwipeableButtonView(
          buttonText: 'Roll Now',
          icon: dice_four,
          buttonWidget: Container(
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
            ),
          ),
          activeColor: const Color(0xFF009C41),
          isFinished: isFinished,
          onWaitingProcess: () {
            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                isFinished = true;
              });
            });
          },
          onFinish: () async {
            setState(() {
              isFinished = false;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          'What to ',
                          style: const TextStyle(
                              fontSize: 34,
                              height: 1,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SpaceGrotesk'),
                          gradient: LinearGradient(colors: [
                            const Color(0xFFCFE1FD).withOpacity(0.9),
                            const Color(0xFFFFFDE1).withOpacity(0.9),
                          ]),
                        ),
                        const SizedBox(height: 8),
                        GradientText(
                          'eat now?',
                          style: const TextStyle(
                              fontSize: 34,
                              height: 1,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SpaceGrotesk'),
                          gradient: LinearGradient(colors: [
                            const Color(0xFFCFE1FD).withOpacity(0.9),
                            const Color(0xFFFFFDE1).withOpacity(0.9),
                          ]),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Column(
                      children: [
                        Image.asset(clouds, width: 48, height: 48),
                        const SizedBox(height: 8),
                        Text(
                          '37°C',
                          style: title4(color: corn1),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height / 4,
                child: const ForYou(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                child: GradientText(
                  'Yesterday',
                  style: const TextStyle(
                      fontSize: 28,
                      height: 1,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
              ),
              const Yesterday(),
              const SizedBox(
                height: 64,
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: IgnorePointer(
              child: Container(
                height: height / 5,
                width: width,
                decoration: BoxDecoration(
                    gradient: Theme.of(context).colorLinearBottom2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}