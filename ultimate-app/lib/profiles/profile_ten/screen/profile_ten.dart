import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';

List<String> items = [bgProfile51, bgProfile52, bgProfile53, bgProfile54];

class ProfileTen extends StatefulWidget {
  const ProfileTen({super.key});

  @override
  State<ProfileTen> createState() => _ProfileTenState();
}

class _ProfileTenState extends State<ProfileTen> {
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 64),
              Stack(
                children: [
                  Image.asset(
                    bgProfile8,
                    height: height / 1.5,
                    width: width,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: height / 2,
                      width: width,
                      decoration: BoxDecoration(
                          gradient: Theme.of(context).colorLinearBottom2),
                    ),
                  ),
                ],
              ),
              Container(
                color: grey100,
                width: width,
                height: height - height / 1.5 - 64,
              )
            ],
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
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
                ),
              ),
              SizedBox(
                height: height / 2,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: grey200,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 48),
                          child: Row(
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
                              Row(
                                children: [
                                  AnimationClick(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 24),
                                      decoration: BoxDecoration(
                                          color: green,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Image.asset(
                                        addUser,
                                        width: 24,
                                        height: 24,
                                        color: grey1100,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  AnimationClick(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 24),
                                      decoration: BoxDecoration(
                                          color: primary,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Image.asset(
                                        chat,
                                        width: 24,
                                        height: 24,
                                        color: grey1100,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        AppWidget.divider(context,
                            color: grey1100.withOpacity(0.1), vertical: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
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
                                    style: subhead(
                                        color: grey800, fontWeight: '400'),
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
                                    style: subhead(
                                        color: grey800, fontWeight: '400'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          child: Text(
                            'Utilmate – UI KIT Mobile App is an unique & creative with high quality & modern design. This package included 1000+ iOS screens.',
                            style: subhead(color: grey800, fontWeight: '400'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -48,
                    left: 24,
                    child: IgnorePointer(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              avtFemale,
                              width: 80,
                              height: 80,
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
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: height / 4,
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(8),
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Experience',
                      style: title4(color: grey1100),
                    ),
                    AnimationClick(
                      child: Image.asset(
                        caretRight,
                        width: 40,
                        height: 40,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
