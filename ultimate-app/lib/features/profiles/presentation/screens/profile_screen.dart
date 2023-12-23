// ignore_for_file: always_declare_return_types, unnecessary_statements

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/features/profiles/domain/entities/user_b_profile_entity.dart';
import 'package:flutter_ultimate/features/profiles/presentation/bloc/subscription_bloc/bloc/subscription_bloc.dart';
import 'package:flutter_ultimate/features/profiles/presentation/widgets/image_slider.dart';
import 'package:flutter_ultimate/features/profiles/presentation/widgets/main_profile_image.dart';
import 'package:flutter_ultimate/features/profiles/presentation/widgets/slider_button.dart';
import 'package:flutter_ultimate/features/profiles/presentation/widgets/subscription_builder.dart';

import '../../../../app/widget_support.dart';
import '../../../../common/constant/colors.dart';
import '../../../../common/constant/images.dart';
import '../../../../common/constant/styles.dart';
import '../../../../common/widget/animation_click.dart';

List<String> items = [bgProfile51, bgProfile52, bgProfile53, bgProfile54];

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.userBProfile});

  final UserBProfile userBProfile;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  // Page controlelr
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  // Image Slider Widget
                  ImageSliderWidget(
                    height: height,
                    pageController: _pageController,
                    widget: widget,
                    width: width,
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

                    // Commented Heart Button
                    // AnimationClick(
                    //   child: Image.asset(
                    //     heart,
                    //     width: 32,
                    //     height: 32,
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: height / 4,
              ),

              // Image Sliders
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Slider
                  SliderButton(
                    pageController: _pageController,
                    direction: 'left',
                    // length: widget.userBProfile.userImages.length,
                    length: widget.userBProfile.userImages.length > 1
                        ? widget.userBProfile.userImages.length
                        : 1,
                  ),
                  // Right Slider
                  SliderButton(
                    pageController: _pageController,
                    direction: 'right',
                    length: widget.userBProfile.userImages.length > 1
                        ? widget.userBProfile.userImages.length
                        : 1,
                  ),
                ],
              ),
              SizedBox(
                height: height / 4,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 28),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //  Name of the user here, you can access it using state.userBProfile.name
                                  Text(
                                    widget.userBProfile.name.length > 15
                                        ? widget.userBProfile.name
                                            .substring(0, 15)
                                        : widget.userBProfile.name,
                                    style: title3(color: grey1100),
                                    overflow: TextOverflow.clip,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'UI/UX Designer',
                                    style: body(color: grey800),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  // Subscription Builder
                                  BlocBuilder<SubscriptionBloc,
                                      SubscriptionState>(
                                    builder: (context, state) {
                                      return AnimationClick(
                                        function: () {
                                          if (!checkSubscriptionState(
                                              context)) {
                                            // User is subscribed, trigger unsubscribe event
                                            context
                                                .read<SubscriptionBloc>()
                                                .add(
                                                  UnSubscribeToUserBEvent(
                                                    userBId:
                                                        widget.userBProfile.id,
                                                  ),
                                                );
                                          } else {
                                            // User is not subscribed, trigger subscribe event
                                            context
                                                .read<SubscriptionBloc>()
                                                .add(
                                                  SubscribeToUserBEvent(
                                                    userBId:
                                                        widget.userBProfile.id,
                                                  ),
                                                );
                                          }
                                        },
                                        child:
                                            SubscriptionBuilder(state: state),
                                      );
                                    },
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

                        // User's Address goes here
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 10),
                          child: Text(
                            widget.userBProfile.address,
                            style: body(color: grey800),
                          ),
                        ),
                        AppWidget.divider(context,
                            color: grey1100.withOpacity(0.1), vertical: 6),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                // User's age Section { access it using widget.userBProfile.age}
                                widget.userBProfile.age,
                                style: body(color: grey800, fontWeight: '400'),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              // User's gender Section { access it using widget.userBProfile.gender}

                              Text(
                                widget.userBProfile.gender,
                                style: subhead(
                                  color: grey800,
                                  fontWeight: '400',
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                '${widget.userBProfile.height} cm',
                                style: subhead(
                                  color: grey800,
                                  fontWeight: '400',
                                ),
                              ),
                            ],
                          ),
                        ),

                        // User's About Section { access it using widget.userBProfile.about}
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 24),
                          child: Text(
                            widget.userBProfile.about,
                            // 'Utilmate – UI KIT Mobile App is an unique & creative with high quality & modern design. This package included 1000+ iOS screens.',
                            style: subhead(color: grey800, fontWeight: '400'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MainProfileImage(widget: widget),
                ],
              ),
              Container(
                // height: height / 4,
                decoration: BoxDecoration(
                  color: grey200,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'User Details',
                          style: title4(color: grey1100),
                        ),

                        // commented animation clilck
                        // AnimationClick(
                        //   child: Image.asset(
                        //     caretRight,
                        //     width: 40,
                        //     height: 40,
                        //   ),
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        Text(
                          'country: ${widget.userBProfile.country}',
                          style: subhead(
                            color: grey800,
                            fontWeight: '400',
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Text(
                          'nationality: ${widget.userBProfile.nationality}',
                          style: subhead(
                            color: grey800,
                            fontWeight: '400',
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Ethinicity: ${widget.userBProfile.ethnicity}',
                          style: subhead(
                            color: grey800,
                            fontWeight: '400',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Interests',
                      style: title4(color: grey1100),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(
                        widget.userBProfile.interest.length,
                        (index) => Chip(
                          label: Text(widget.userBProfile.interest[index]),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 87, 163, 198),
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  // Subscription checker function
  bool checkSubscriptionState(BuildContext context) {
    final state = context.read<SubscriptionBloc>().state;
    if (state is SubscriptionSuccessState) {
      return false;
    }
    return true;
  }
}
