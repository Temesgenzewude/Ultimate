import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/dot_widget.dart';

List<Map<String, dynamic>> items = [
  <String, dynamic>{
    'title': 'Earning',
    'balance': '\$33,680.16',
    'subTitle': '+\$200 this week',
    'bg': primary,
  },
  <String, dynamic>{
    'title': 'Invite',
    'balance': '\$128',
    'subTitle': '+4 waiting',
    'bg': grey200,
  }
];

class InviteFriends extends StatelessWidget {
  const InviteFriends({super.key});

  Widget itemInvite(Map<String, dynamic> item) {
    return AnimationClick(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: item['bg'], borderRadius: BorderRadius.circular(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item['title'],
              style: subhead(color: grey1100),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 4),
              child: Text(
                item['balance'],
                style: title4(color: grey1100),
              ),
            ),
            GradientText(
              item['subTitle'],
              style: const TextStyle(
                  fontSize: 14,
                  height: 1,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SpaceGrotesk'),
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(
          context: context,
          hasLeading: true,
          hasPop: true,
          title: 'Invite Friends'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Expanded(child: itemInvite(items[0])),
                const SizedBox(width: 4),
                Expanded(child: itemInvite(items[1]))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Stack(clipBehavior: Clip.none, children: [
              Container(
                margin: EdgeInsets.only(top: height / 6),
                height: height / 2,
                decoration: BoxDecoration(
                  color: grey200,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              Positioned(
                  bottom: -12,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 12,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: const BoxDecoration(
                        color: grey300,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(24))),
                  )),
              Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Image.asset(
                          hand51,
                          height: height / 4,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'You \$5, Friends 5\$',
                          style: title2(color: corn1),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Invite your friend to Ultimate Mobile App UI KIT and both get gift from us.',
                            textAlign: TextAlign.center,
                            style: body(color: grey1100),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: height / 20, bottom: 16),
                          child: AnimationClick(
                              child: SizedBox(
                                  width: width, child: const DotWidget())),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AppWidget.typeButtonStartAction2(
                                  context: context,
                                  input: 'Copy',
                                  bgColor: primary,
                                  borderColor: primary,
                                  icon: copy,
                                  sizeAsset: 24,
                                  textColor: grey1100,
                                  borderRadius: 16,
                                  onPressed: () {}),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: AppWidget.typeButtonStartAction2(
                                  context: context,
                                  input: 'Share',
                                  bgColor: green,
                                  borderColor: green,
                                  icon: share,
                                  sizeAsset: 24,
                                  textColor: grey1100,
                                  borderRadius: 16,
                                  onPressed: () {}),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
