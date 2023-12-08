import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/common/constant/styles.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool messageMode = false;
  bool newsMode = false;
  bool otherMode = false;

  Map<String, bool> switchStates = {
    'messageMode': false,
    'newsMode': false,
    'otherMode': false,
  };

  Widget item(
    String title,
    Color bgColor,
    String image, {
    bool isSwitch = false,
    required valueUsed,
    Function(bool value)? onToggle,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(16)),
            child: Image.asset(image, width: 28, height: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: headline(color: grey1100),
            ),
          ),
          if (isSwitch) ...[
            CupertinoSwitch(
              activeColor: primary,
              value: switchStates[valueUsed]!,
              onChanged: (value) {
                setState(() {
                  switchStates[valueUsed] = value;
                });
              },
            )
          ] else ...[
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 32,
              color: grey500,
            )
          ]
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(16)),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '300P',
                      style: headline(color: grey100),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Image.asset(
                      brain,
                      width: 16,
                      height: 16,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(48),
                      child: Image.asset(
                        avtFemale,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        'Albert Flores',
                        style: title3(color: grey1100),
                      ),
                    ),
                    Text(
                      'UI/UX Designer',
                      style: body(color: grey800),
                    ),

                    // Commented Go Pro button
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       top: 8, bottom: 32, left: 48, right: 48),
                    //   child: AppWidget.typeButtonStartAction2(
                    //       context: context,
                    //       input: 'Go Pro Account!',
                    //       onPressed: () {},
                    //       icon: cat,
                    //       sizeAsset: 24,
                    //       bgColor: primary,
                    //       borderColor: primary,
                    //       textColor: grey1100),
                    // ),
                    Expanded(
                      child: Column(
                        children: [
                          item(
                            'Message notification',
                            grey300,
                            bellRinging,
                            isSwitch: true,
                            valueUsed: 'messageMode',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: item(
                              'News notification',
                              grey300,
                              bellRinging,
                              isSwitch: true,
                              valueUsed: 'newsMode',
                            ),
                          ),
                          item(
                            'All notification',
                            grey300,
                            bellRinging,
                            isSwitch: true,
                            valueUsed: 'otherMode',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: item(
                              'Gerenal Settings',
                              grey300,
                              gearSix,
                              onToggle: (value) {},
                              valueUsed: 'null',
                              isSwitch: false,
                            ),
                          ),
                          item('Portfolios', grey300, gearSix,
                              onToggle: (value) {},
                              valueUsed: 'null',
                              isSwitch: false),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimationClick(
                          child: Text(
                            'Help Center',
                            style: body(color: grey600),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimationClick(
                              child: Text(
                                'Logout',
                                style: body(color: grey600),
                              ),
                            ),
                            Text(
                              'Feb 2021',
                              style: body(color: grey600),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
