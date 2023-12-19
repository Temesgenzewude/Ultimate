import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/common/bloc/slider/slider_bloc.dart';
import 'package:flutter_ultimate/common/bloc/slider/slider_event.dart';
import 'package:flutter_ultimate/features/profiles/domain/entities/user_b_profile_entity.dart';
import 'package:flutter_ultimate/features/profiles/presentation/bloc/subscription_bloc/bloc/subscription_bloc.dart';

import '../../../../app/widget_support.dart';
import '../../../../common/constant/colors.dart';
import '../../../../common/constant/images.dart';
import '../../../../common/constant/styles.dart';
import '../../../../common/widget/animation_click.dart';

List<String> items = [bgProfile51, bgProfile52, bgProfile53, bgProfile54];

class ProfileScreen2 extends StatefulWidget {
  const ProfileScreen2({super.key, required this.userBProfile});

  final UserBProfile userBProfile;

  @override
  State<ProfileScreen2> createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  late SliderBloc sliderBloc;
  @override
  void initState() {
    super.initState();
    sliderBloc = BlocProvider.of<SliderBloc>(context);
  }

  Widget buildSubscriptionButton(SubscriptionState state) {
    if (state is SubscriptionSuccessState) {
      // Subscription was successful
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.grey, // Change color accordingly
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(Icons.check, color: Colors.white),
      );
    } else if (state is SubscriptionFailureState) {
      // Subscription failed
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.red, // Change color accordingly
          borderRadius: BorderRadius.circular(16),
        ),
        child:
            Text('Subscription Failed', style: TextStyle(color: Colors.white)),
      );
    } else {
      // Subscription is in progress or initial state
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.green, // Change color accordingly
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(
          addUser,
          width: 24,
          height: 24,
          color: Colors.grey,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    // return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
    //   if (state is ProfileLoadingState || state is ProfileInitialState) {
    //     return const Scaffold(
    //       body: Center(child: CircularProgressIndicator()),
    //     );
    //   } else if (state is ProfileFailureState) {
    //     return const Scaffold(
    //       body: Center(
    //         child: Text('Failure'),
    //       ),
    //     );
    //   } else if (state is UserBProfileSuccessState) {
    //     print('------------------');
    //     print(state);
    //     print('------------------');

    print('User B Profiles in Screen ${widget.userBProfile.id}');
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          // pinned: true,
          floating: false,
          // pinned: true,
          expandedHeight: height / 1.1,
          collapsedHeight: height / 1.1,
          flexibleSpace: Stack(
            children: [
              Container(
                height: height / 1,
              ),
              // Image Slider Widget
              Container(
                height: height / 1.5,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                child: BlocBuilder<SliderBloc, int>(
                  builder: (context, sliderState) {
                    return PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.userBProfile.userImages.isNotEmpty
                          ? widget.userBProfile.userImages.length
                          : 1,
                      onPageChanged: (value) {
                        if (value > sliderState) {
                          sliderBloc.add(SwipeRight());
                        } else {
                          sliderBloc.add(SwipeLeft());
                        }
                      },
                      itemBuilder: (context, index) {
                        return widget.userBProfile.userImages.isEmpty
                            ? Image.asset(
                                bgProfile8,
                                height: height / 1.5,
                                width: width,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.userBProfile.userImages[index],
                                height: height / 1.5,
                                width: width,
                                fit: BoxFit.cover,
                              );
                      },
                    );
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       AnimationClick(
              //         function: () {
              //           Navigator.of(context).pop();
              //         },
              //         child: Image.asset(
              //           careLeft,
              //           width: 32,
              //           height: 32,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              Positioned(
                bottom: 0,
                left: 0,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: width - 16,
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
                                    SizedBox(
                                      width: width / 2,
                                      child: Text(
                                        widget.userBProfile.name,
                                        
                                        overflow: TextOverflow.ellipsis,
                                        // 'Albert Flores',
                                        style: title3(color: grey1100),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      // state.userBProfile.address,
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
                                    BlocBuilder<SubscriptionBloc,
                                        SubscriptionState>(
                                      builder: (context, state) {
                                        return AnimationClick(
                                          function: () {
                                            checkSubscriptionState(context)
                                                ? context
                                                    .read<SubscriptionBloc>()
                                                    .add(
                                                      SubscribeToUserBEvent(
                                                        userBId: widget
                                                            .userBProfile.id,
                                                      ),
                                                    )
                                                : () {};
                                          },
                                          child: buildSubscriptionButton(state),
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
                                  style:
                                      body(color: grey800, fontWeight: '400'),
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
                  ],
                ),
              ),
              Positioned(
                top: height / 1.8,
                left: 30,
                child: IgnorePointer(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: widget.userBProfile.imageUrl == ''
                            ? Image.asset(
                                avtFemale,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.userBProfile.imageUrl,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // SliverToBoxAdapter(
        //   child: Stack(
        //     clipBehavior: Clip.none,
        //     children: [
        //       Container(
        //         margin: const EdgeInsets.all(8),
        //         decoration: BoxDecoration(
        //             color: grey200, borderRadius: BorderRadius.circular(16)),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Padding(
        //               padding:
        //                   const EdgeInsets.only(left: 24, right: 24, top: 28),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       //  Name of the user here, you can access it using state.userBProfile.name
        //                       Text(
        //                         widget.userBProfile.name,
        //                         // 'Albert Flores',
        //                         style: title3(color: grey1100),
        //                       ),
        //                       const SizedBox(height: 8),
        //                       Text(
        //                         // state.userBProfile.address,
        //                         'UI/UX Designer',
        //                         style: body(color: grey800),
        //                       ),
        //                       const SizedBox(
        //                         height: 5,
        //                       ),
        //                     ],
        //                   ),
        //                   Row(
        //                     children: [
        //                       BlocBuilder<SubscriptionBloc, SubscriptionState>(
        //                         builder: (context, state) {
        //                           return AnimationClick(
        //                             function: () {
        //                               checkSubscriptionState(context)
        //                                   ? context
        //                                       .read<SubscriptionBloc>()
        //                                       .add(
        //                                         SubscribeToUserBEvent(
        //                                           userBId:
        //                                               widget.userBProfile.id,
        //                                         ),
        //                                       )
        //                                   : () {};
        //                             },
        //                             child: buildSubscriptionButton(state),
        //                           );
        //                         },
        //                       ),
        //                       const SizedBox(width: 8),
        //                       AnimationClick(
        //                         child: Container(
        //                           padding: const EdgeInsets.symmetric(
        //                               vertical: 16, horizontal: 24),
        //                           decoration: BoxDecoration(
        //                               color: primary,
        //                               borderRadius: BorderRadius.circular(16)),
        //                           child: Image.asset(
        //                             chat,
        //                             width: 24,
        //                             height: 24,
        //                             color: grey1100,
        //                           ),
        //                         ),
        //                       )
        //                     ],
        //                   )
        //                 ],
        //               ),
        //             ),

        //             // User's Address goes here
        //             Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   horizontal: 24.0, vertical: 10),
        //               child: Text(
        //                 widget.userBProfile.address,
        //                 style: body(color: grey800),
        //               ),
        //             ),
        //             AppWidget.divider(context,
        //                 color: grey1100.withOpacity(0.1), vertical: 6),
        //             Padding(
        //               padding: const EdgeInsets.symmetric(horizontal: 24),
        //               child: Row(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     // User's age Section { access it using widget.userBProfile.age}
        //                     widget.userBProfile.age,
        //                     style: body(color: grey800, fontWeight: '400'),
        //                   ),
        //                   const SizedBox(
        //                     width: 16,
        //                   ),
        //                   // User's gender Section { access it using widget.userBProfile.gender}

        //                   Text(
        //                     widget.userBProfile.gender,
        //                     style: subhead(
        //                       color: grey800,
        //                       fontWeight: '400',
        //                     ),
        //                   ),
        //                   const SizedBox(width: 16),
        //                   Text(
        //                     '${widget.userBProfile.height} cm',
        //                     style: subhead(
        //                       color: grey800,
        //                       fontWeight: '400',
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),

        //             // User's About Section { access it using widget.userBProfile.about}
        //             Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   vertical: 10, horizontal: 24),
        //               child: Text(
        //                 widget.userBProfile.about,
        //                 // 'Utilmate – UI KIT Mobile App is an unique & creative with high quality & modern design. This package included 1000+ iOS screens.',
        //                 style: subhead(color: grey800, fontWeight: '400'),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        SliverToBoxAdapter(
          child: Container(
            // height: height / 4,
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
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
                      backgroundColor: const Color.fromARGB(
                        255,
                        87,
                        163,
                        198,
                      ),
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
          ),
        )
      ],
    )

        // body: Stack(
        //   children: [
        //     Column(
        //       children: [
        //         // const SizedBox(height: 64),
        //         Stack(
        //           children: [
        //             // Image Slider Widget
        //             Container(
        //               height: height / 1.5,
        //               margin: const EdgeInsets.symmetric(horizontal: 4),
        //               decoration: BoxDecoration(
        //                   color: grey200,
        //                   borderRadius: BorderRadius.circular(16)),
        //               child: BlocBuilder<SliderBloc, int>(
        //                 builder: (context, sliderState) {
        //                   return PageView.builder(
        //                     scrollDirection: Axis.horizontal,
        //                     itemCount: 3,
        //                     onPageChanged: (value) {
        //                       if (value > sliderState) {
        //                         sliderBloc.add(SwipeRight());
        //                       } else {
        //                         sliderBloc.add(SwipeLeft());
        //                       }
        //                     },
        //                     itemBuilder: (context, index) {
        //                       return Image.asset(
        //                         bgProfile8,
        //                         height: height / 1.5,
        //                         width: width,
        //                         fit: BoxFit.fill,
        //                       );
        //                       //     Image.network(
        //                       //   state.userBProfile.imageUrls[0],
        //                       //   height: height / 1.5,
        //                       //   width: width,
        //                       //   fit: BoxFit.fill,
        //                       // );
        //                       // );
        //                     },
        //                   );
        //                 },
        //               ),
        //             ),
        //             // Image.asset(
        //             //   bgProfile8,
        //             //   height: height / 1.5,
        //             //   width: width,
        //             //   fit: BoxFit.fill,
        //             // ),
        //             // Positioned(
        //             //   bottom: 0,
        //             //   child: Container(
        //             //     height: height / 2,
        //             //     width: width,
        //             //     decoration: BoxDecoration(
        //             //         gradient: Theme.of(context).colorLinearBottom2),
        //             //   ),
        //             // ),
        //           ],
        //         ),
        //         Container(
        //           color: grey100,
        //           width: width,
        //           height: height - height / 1.5 - 64,
        //         )
        //       ],
        //     ),
        //     ListView(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               AnimationClick(
        //                 function: () {
        //                   Navigator.of(context).pop();
        //                 },
        //                 child: Image.asset(
        //                   careLeft,
        //                   width: 32,
        //                   height: 32,
        //                 ),
        //               ),

        //               // Commented Heart Button

        //               // AnimationClick(
        //               //   child: Image.asset(
        //               //     heart,
        //               //     width: 32,
        //               //     height: 32,
        //               //   ),
        //               // )
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           height: height / 2,
        //         ),
        //         Stack(
        //           clipBehavior: Clip.none,
        //           children: [
        //             Container(
        //               margin: const EdgeInsets.all(8),
        //               decoration: BoxDecoration(
        //                   color: grey200,
        //                   borderRadius: BorderRadius.circular(16)),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.only(
        //                         left: 24, right: 24, top: 28),
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: [
        //                         Column(
        //                           crossAxisAlignment: CrossAxisAlignment.start,
        //                           children: [
        //                             //  Name of the user here, you can access it using state.userBProfile.name
        //                             Text(
        //                               widget.userBProfile.name,
        //                               // 'Albert Flores',
        //                               style: title3(color: grey1100),
        //                             ),
        //                             const SizedBox(height: 8),
        //                             Text(
        //                               // state.userBProfile.address,
        //                               'UI/UX Designer',
        //                               style: body(color: grey800),
        //                             ),
        //                             const SizedBox(
        //                               height: 5,
        //                             ),
        //                           ],
        //                         ),
        //                         Row(
        //                           children: [
        //                             BlocBuilder<SubscriptionBloc,
        //                                 SubscriptionState>(
        //                               builder: (context, state) {
        //                                 return AnimationClick(
        //                                   function: () {
        //                                     checkSubscriptionState(context)
        //                                         ? context
        //                                             .read<SubscriptionBloc>()
        //                                             .add(
        //                                               SubscribeToUserBEvent(
        //                                                 userBId: widget
        //                                                     .userBProfile.id,
        //                                               ),
        //                                             )
        //                                         : () {};
        //                                   },
        //                                   child: buildSubscriptionButton(state),
        //                                 );
        //                               },
        //                             ),
        //                             const SizedBox(width: 8),
        //                             AnimationClick(
        //                               child: Container(
        //                                 padding: const EdgeInsets.symmetric(
        //                                     vertical: 16, horizontal: 24),
        //                                 decoration: BoxDecoration(
        //                                     color: primary,
        //                                     borderRadius:
        //                                         BorderRadius.circular(16)),
        //                                 child: Image.asset(
        //                                   chat,
        //                                   width: 24,
        //                                   height: 24,
        //                                   color: grey1100,
        //                                 ),
        //                               ),
        //                             )
        //                           ],
        //                         )
        //                       ],
        //                     ),
        //                   ),

        //                   // User's Address goes here
        //                   Padding(
        //                     padding: const EdgeInsets.symmetric(
        //                         horizontal: 24.0, vertical: 10),
        //                     child: Text(
        //                       widget.userBProfile.address,
        //                       style: body(color: grey800),
        //                     ),
        //                   ),
        //                   AppWidget.divider(context,
        //                       color: grey1100.withOpacity(0.1), vertical: 6),
        //                   Padding(
        //                     padding: const EdgeInsets.symmetric(horizontal: 24),
        //                     child: Row(
        //                       mainAxisAlignment: MainAxisAlignment.start,
        //                       children: [
        //                         Text(
        //                           // User's age Section { access it using widget.userBProfile.age}
        //                           widget.userBProfile.age,
        //                           style: body(color: grey800, fontWeight: '400'),
        //                         ),
        //                         const SizedBox(
        //                           width: 16,
        //                         ),
        //                         // User's gender Section { access it using widget.userBProfile.gender}

        //                         Text(
        //                           widget.userBProfile.gender,
        //                           style: subhead(
        //                             color: grey800,
        //                             fontWeight: '400',
        //                           ),
        //                         ),
        //                         const SizedBox(width: 16),
        //                         Text(
        //                           '${widget.userBProfile.height} cm',
        //                           style: subhead(
        //                             color: grey800,
        //                             fontWeight: '400',
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),

        //                   // User's About Section { access it using widget.userBProfile.about}
        //                   Padding(
        //                     padding: const EdgeInsets.symmetric(
        //                         vertical: 10, horizontal: 24),
        //                     child: Text(
        //                       widget.userBProfile.about,
        //                       // 'Utilmate – UI KIT Mobile App is an unique & creative with high quality & modern design. This package included 1000+ iOS screens.',
        //                       style: subhead(color: grey800, fontWeight: '400'),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             Positioned(
        //               top: -48,
        //               left: 24,
        //               child: IgnorePointer(
        //                 child: Stack(
        //                   clipBehavior: Clip.none,
        //                   children: [
        //                     ClipRRect(
        //                       borderRadius: BorderRadius.circular(16),
        //                       child: widget.userBProfile.imageUrl == ''
        //                           ? Image.asset(
        //                               avtFemale,
        //                               width: 80,
        //                               height: 80,
        //                               fit: BoxFit.cover,
        //                             )
        //                           : Image.network(
        //                               widget.userBProfile.imageUrl,
        //                               width: 80,
        //                               height: 80,
        //                               fit: BoxFit.cover,
        //                             ),
        //                     ),
        //                     Positioned(
        //                       bottom: 0,
        //                       right: 0,
        //                       child: Container(
        //                         decoration: BoxDecoration(
        //                             color: grey1100,
        //                             borderRadius: BorderRadius.circular(32)),
        //                         child: Image.asset(
        //                           checkbox,
        //                           width: 24,
        //                           height: 24,
        //                         ),
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         Container(
        //           // height: height / 4,
        //           decoration: BoxDecoration(
        //               color: grey200, borderRadius: BorderRadius.circular(16)),
        //           alignment: Alignment.topCenter,
        //           margin: const EdgeInsets.all(8),
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(
        //                     'User Details',
        //                     style: title4(color: grey1100),
        //                   ),

        //                   // commented animation clilck
        //                   // AnimationClick(
        //                   //   child: Image.asset(
        //                   //     caretRight,
        //                   //     width: 40,
        //                   //     height: 40,
        //                   //   ),
        //                   // )
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 14,
        //               ),
        //               Row(
        //                 children: [
        //                   Text(
        //                     'country: ${widget.userBProfile.country}',
        //                     style: subhead(
        //                       color: grey800,
        //                       fontWeight: '400',
        //                     ),
        //                   ),
        //                   const SizedBox(
        //                     width: 18,
        //                   ),
        //                   Text(
        //                     'nationality: ${widget.userBProfile.nationality}',
        //                     style: subhead(
        //                       color: grey800,
        //                       fontWeight: '400',
        //                     ),
        //                   )
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 15,
        //               ),
        //               Row(
        //                 children: [
        //                   Text(
        //                     'Ethinicity: ${widget.userBProfile.ethnicity}',
        //                     style: subhead(
        //                       color: grey800,
        //                       fontWeight: '400',
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 25,
        //               ),
        //               Text(
        //                 'Interests',
        //                 style: title4(color: grey1100),
        //               ),
        //               const SizedBox(
        //                 height: 20,
        //               ),
        //               Wrap(
        //                 spacing: 10,
        //                 runSpacing: 10,
        //                 children: List.generate(
        //                   widget.userBProfile.interest.length,
        //                   (index) => Chip(
        //                     label: Text(widget.userBProfile.interest[index]),
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(20),
        //                     ),
        //                     backgroundColor: const Color.fromARGB(
        //                       255,
        //                       87,
        //                       163,
        //                       198,
        //                     ),
        //                     labelStyle: const TextStyle(
        //                       color: Colors.black,
        //                       fontSize: 16,
        //                       fontWeight: FontWeight.w800,
        //                     ),
        //                   ),
        //                 ),
        //               )
        //             ],
        //           ),
        //         )
        //       ],
        //     ),

        //     Container(
        //       color: Colors.blue,
        //       height: 20,
        //       width: double.infinity,
        //     )
        //   ],
        // ),
        );
  }

  bool checkSubscriptionState(BuildContext context) {
    final state = context.read<SubscriptionBloc>().state;
    print('Staaaaaaaaaaaaaaaaaaaaaaaaaaaaate: $state');
    if (state is SubscriptionSuccessState) {
      return false;
    }
    return true;
  }
}
