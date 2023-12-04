import 'package:flutter/material.dart';
import '../../../../app/widget_support.dart';
import '../../../../common/constant/colors.dart';
import '../../../../common/constant/images.dart';
import '../../../../common/constant/styles.dart';

import '../../../../common/widget/animation_click.dart';
import '../widget/second_page.dart';

class ProfileEight extends StatelessWidget {
  const ProfileEight({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 64),
            child: Stack(
              children: [
                Image.asset(
                  bgProfile8,
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: height / 3,
                    width: width,
                    decoration: BoxDecoration(
                        gradient: Theme.of(context).colorLinearBottom2),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 64,
              left: 24,
              right: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimationClick(
                    function: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      careLeft,
                      width: 32,
                      height: 32,
                    ),
                  ),
                  AnimationClick(
                    child: Image.asset(
                      heart,
                      width: 32,
                      height: 32,
                    ),
                  )
                ],
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Albert Flores',
                          style: title3(color: grey1100),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Image.asset(checkbox, width: 24, height: 24)
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                      style: body(color: grey800),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 24, bottom: 16, left: 16, right: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppWidget.typeButtonStartAction2(
                              context: context,
                              input: 'Follow Me',
                              onPressed: () {},
                              icon: addUser,
                              sizeAsset: 24,
                              colorAsset: primary,
                              bgColor: grey1100,
                              borderColor: grey1100,
                              textColor: primary),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: AppWidget.typeButtonStartAction2(
                              context: context,
                              input: 'Chat Now',
                              onPressed: () {},
                              icon: chat,
                              sizeAsset: 24,
                              bgColor: primary,
                              borderColor: primary,
                              textColor: grey1100),
                        ),
                      ],
                    ),
                  ),
                  AnimationClick(
                    function: () {
                      Navigator.of(context).push<dynamic>(SecondPageRoute());
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                          color: grey100,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'All Information',
                            style: title4(color: corn1),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: corn1,
                            size: 24,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
