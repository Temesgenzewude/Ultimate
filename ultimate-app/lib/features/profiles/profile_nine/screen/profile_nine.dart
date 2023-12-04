import 'package:flutter/material.dart';

import '../../../../app/widget_support.dart';
import '../../../../common/constant/colors.dart';
import '../../../../common/constant/images.dart';
import '../../../../common/constant/styles.dart';
import '../../../../common/widget/animation_click.dart';

List<String> photos = [
  bgProfile91,
  bgProfile92,
  bgProfile93,
  bgProfile94,
  bgProfile91,
  bgProfile92,
  bgProfile93,
  bgProfile94
];

List<String> avts = [
  avtMale2,
  avtMale3,
  avtMale4,
  avtMale5,
  avtMale6,
  avtMale7,
  avtMale8,
  avtMale9,
  avtMale10,
];

class ProfileNine extends StatelessWidget {
  const ProfileNine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(
          context: context,
          hasLeading: true,
          hasPop: true,
          title: 'Profile',
          onTap: () {},
          action: Image.asset(
            googlePodcastsLogo,
            width: 24,
            height: 24,
            color: grey1100,
          )),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Albert Flores',
                          style: title3(color: grey1100),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'UI/UX Designer',
                          style: body(color: grey800),
                        )
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            avtFemale,
                            width: 72,
                            height: 72,
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: grey1100,
                                  borderRadius: BorderRadius.circular(32)),
                              child: Image.asset(
                                checkbox,
                                width: 24,
                                height: 24,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
                AppWidget.divider(context,
                    color: grey1100.withOpacity(0.1), vertical: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '230K',
                          style: headline(color: grey1100),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Following',
                          style: subhead(color: grey800, fontWeight: '400'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          '230K',
                          style: headline(color: grey1100),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Follower',
                          style: subhead(color: grey800, fontWeight: '400'),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Utilmate – UI KIT Mobile App is an unique & creative with high quality & modern design. This package included 1000+ iOS screens.',
                    style: subhead(color: grey800, fontWeight: '400'),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      mapPin,
                      width: 20,
                      height: 20,
                      color: corn1,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '3891 Ranchview, California 62639',
                      style: subhead(color: grey1100, fontWeight: '400'),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: AppWidget.typeButtonStartAction(
                      context: context,
                      input: 'Follow Me',
                      onPressed: () {},
                      icon: addUser,
                      sizeAsset: 24,
                      colorAsset: grey1100,
                      bgColor: green,
                      borderColor: green,
                      textColor: grey1100),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AppWidget.typeButtonStartAction(
                      context: context,
                      input: 'Message',
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Friends',
                            style: body(color: grey1100, fontWeight: '700'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                color: corn1,
                                borderRadius: BorderRadius.circular(16)),
                            child: Text(
                              '13',
                              style: headline(color: grey100),
                            ),
                          )
                        ],
                      ),
                      AnimationClick(
                          child: Image.asset(
                        icArrowRight,
                        width: 24,
                        height: 24,
                        color: grey1100,
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 56,
                  child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => AnimationClick(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: Image.asset(
                                avts[index],
                                width: 56,
                                height: 56,
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 24,
                          ),
                      itemCount: avts.length),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Photos',
                            style: body(color: grey1100, fontWeight: '700'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                color: corn1,
                                borderRadius: BorderRadius.circular(16)),
                            child: Text(
                              '2.8k',
                              style: headline(color: grey100),
                            ),
                          )
                        ],
                      ),
                      AnimationClick(
                          child: Image.asset(
                        icArrowRight,
                        width: 24,
                        height: 24,
                        color: grey1100,
                      ))
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 84,
                  child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => AnimationClick(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                photos[index],
                                width: 84,
                                height: 84,
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 24,
                          ),
                      itemCount: photos.length),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
