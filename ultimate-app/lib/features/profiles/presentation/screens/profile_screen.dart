import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/common/bloc/slider/slider_bloc.dart';
import 'package:flutter_ultimate/common/bloc/slider/slider_event.dart';
import 'package:flutter_ultimate/features/profiles/presentation/bloc/profile_bloc.dart';
import 'package:flutter_ultimate/socials_media/feed/widget/onboarding_widget.dart';

import '../../../../app/widget_support.dart';
import '../../../../common/constant/colors.dart';
import '../../../../common/constant/images.dart';
import '../../../../common/constant/styles.dart';
import '../../../../common/widget/animation_click.dart';

List<String> items = [bgProfile51, bgProfile52, bgProfile53, bgProfile54];

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc _profileBloc;
  late SliderBloc sliderBloc;
  @override
  void initState() {
    super.initState();
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    sliderBloc = BlocProvider.of<SliderBloc>(context);
    _profileBloc.add(GetProfileByIdEvent(userId: 'id'));
  }

  Map<String, dynamic> item = <String, dynamic>{
    'avt': avtFemale,
    'name': 'Albert Flores',
    'bgImage': [bgOb1, bgOb12, bgOb1, bgOb12],
    'music': 'Why Do You Love Me',
    'time': '15 mins ago',
    'bgColor': grey200,
    'crown': '12k',
    'chat': '234',
    'share': '528'
  };

  int currentIndex = 0;
  // final PageController _controller = PageController(initialPage: 0);

  void updateIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      if (state is ProfileLoadingState) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      } else if (state is ProfileFailureState) {
        return const Scaffold(
          body: Text('Succcess'),
        );
      } else if (state is UserBProfileSuccessState) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: height / 2.3,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        AnimationClick(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                color: item['bgColor'],
                                borderRadius: BorderRadius.circular(16)),
                            child: BlocBuilder<SliderBloc, int>(
                              builder: (context, sliderState) {
                                return PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: item['bgImage'].length,
                                  onPageChanged: (value) {
                                    if (value > sliderState) {
                                      sliderBloc.add(SwipeRight());
                                    } else {
                                      sliderBloc.add(SwipeLeft());
                                    }
                                  },
                                  itemBuilder: (context, index) {
                                    return
                                        // Image.asset(
                                        //   item['bgImage'][index],
                                        // );
                                        ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        const Color.fromARGB(255, 0, 0, 0)
                                            .withOpacity(
                                                0.5), // Adjust opacity and color as needed
                                        BlendMode.srcOver,
                                      ),
                                      child: Image.network(
                                        state.userBProfile.imageUrls[0],
                                        fit: BoxFit.fill,
                                        // opacity: ,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 16,
                          child: BlocBuilder<SliderBloc, int>(
                            builder: (context, state) {
                              return OnBoardingWidget.createIndicator(
                                lengthImage: item['bgImage'].length,
                                currentImage: state,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: AnimationClick(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: grey100,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text(
                                '1 - 13',
                                style: subhead(color: grey600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 22, right: 22, top: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: width * (1.2 / 2),
                                child: Row(
                                  children: [
                                    Text(
                                      // "alfja;ldfjafadadf",
                                      state.userBProfile.name,
                                      style: title3(color: grey1100),
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.userBProfile.age,
                                    style: body(color: grey800),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    state.userBProfile.gender,
                                    style: body(color: grey800),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    state.userBProfile.height,
                                    style: body(color: grey800),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                state.userBProfile.address.substring(0, 27),
                                style: body(color: grey800),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                state.userBProfile.country,
                                style: body(color: grey800),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '4.5',
                                    style: headline(color: grey1100),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  AnimationClick(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 16),
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
                                    function: () {},
                                  ),
                                  const SizedBox(width: 5),
                                  AnimationClick(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14, horizontal: 16),
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
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    AppWidget.divider(
                      context,
                      color: grey1100.withOpacity(0.1),
                      vertical: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Nationality',
                                style: headline(color: grey1100),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                state.userBProfile.nationality,
                                style: body(color: grey800, fontWeight: '400'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'Ethnicity',
                                style: headline(color: grey1100),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                state.userBProfile.ethnicity,
                                style: body(color: grey800, fontWeight: '400'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    AppWidget.divider(
                      context,
                      color: grey1100.withOpacity(0.1),
                      vertical: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About',
                            style: headline(color: grey1100),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Text(
                          //   'Romantic wordsmith and passionate poet, weaving verses that resonate with the heart. Seeking a muse to inspire new chapters of poetry and create a love story that transcends the pages.',
                          //   style: body(color: grey800, fontWeight: '400'),
                          // ),
                          Text(
                            state.userBProfile.about,
                            style: body(color: grey800, fontWeight: '400'),
                          ),
                        ],
                      ),
                    ),
                    AppWidget.divider(
                      context,
                      color: grey1100.withOpacity(0.1),
                      vertical: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Interests',
                            style: headline(color: grey1100),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: List.generate(
                              state.userBProfile.interest.length,
                              (index) => Chip(
                                label: Text(state.userBProfile.interest[index]),
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
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return const Scaffold(
          body: Text('initial state'),
        );
      }
    });
  }
}
