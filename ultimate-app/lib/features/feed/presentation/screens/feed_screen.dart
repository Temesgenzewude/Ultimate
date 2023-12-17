import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/app/widget_support.dart';
import 'package:flutter_ultimate/authentications/add_mobile_number/screen/add_mobile_number.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/common/constant/styles.dart';
import 'package:flutter_ultimate/common/route/routes.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';
import 'package:flutter_ultimate/common/widget/app_bar_cpn.dart';
import 'package:flutter_ultimate/common/widget/gradient_text.dart';
import 'package:flutter_ultimate/features/feed/presentation/bloc/admin_notification_bloc.dart';
import 'package:flutter_ultimate/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:flutter_ultimate/features/feed/presentation/bloc/notification_bloc.dart';
import 'package:flutter_ultimate/features/feed/presentation/widgets/admin_notification_widget.dart';
import 'package:flutter_ultimate/features/feed/presentation/widgets/build_tab_bar.dart';
import 'package:flutter_ultimate/features/feed/presentation/widgets/item_coin.dart';
import 'package:flutter_ultimate/features/feed/presentation/widgets/user_notification_widget.dart';
import 'package:flutter_ultimate/features/profiles/presentation/screens/profiles_landing_screen.dart';
import 'package:flutter_ultimate/readings/main_seller_1/widget/podcast.dart';

import '../../../../common/bloc/auth/authentication_bloc.dart';
import '../../../../common/bloc/auth/b/authentication_bloc_b.dart';
import '../../../../common/util/show_toast_message.dart';

List<Map<String, dynamic>> hotToday = [
  <String, dynamic>{
    'title': 'Decentralized Digital Art Gallery',
    'time': 'February 29, 2012',
    'tag': 'Crypto',
    'description':
        'Why are Kalshi’s Event contracts generally different from other instruments I’m banned from trading?',
    'image': main_seller_1
  },
  <String, dynamic>{
    'title': 'Discover the Exciting World of Digital Art',
    'time': 'February 29, 2012',
    'tag': 'Crypto',
    'description':
        'Why are Kalshi’s Event contracts generally different from other instruments I’m banned from trading?',
    'image': main_seller_2
  },
];

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int selected = 0;
  List<String> tabs = ['Hot Today', 'Trending', 'Popular'];

  late FeedBloc _feedBloc;
  @override
  void initState() {
    super.initState();
    context.read<FeedBloc>().add(GetFeedsEvent());
    // context
    //     .read<NotificationBloc>()
    //     .add(GetAdminNotificationsEvent(chatId: '', senderId: ''));
    context
        .read<NotificationBloc>()
        .add(GetUserNotificationsEvent(chatId: '', senderId: ''));
    // _feedBloc = BlocProvider.of<FeedBloc>(context);
    // _feedBloc.add(GetFeedsEvent());
  }

  Widget itemCoin(String icon, String money, String rate, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 18, height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GradientText(
            '\$$money',
            style: const TextStyle(
                fontSize: 18, height: 1.2, fontFamily: 'SpaceGrotesk'),
            gradient: LinearGradient(colors: [
              const Color(0xFFCFE1FD).withOpacity(0.9),
              const Color(0xFFFFFDE1).withOpacity(0.9),
            ]),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(12)),
          child: Text(
            rate,
            style: caption1(color: grey1100),
          ),
        )
      ],
    );
  }

  Widget item(String title, String time, String image) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: headline(color: grey1100),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: caption1(color: grey600),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 80,
              height: 64,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

  Widget tabView(
      List<Map<String, dynamic>> items, double height, double width) {
    return SizedBox(
      height: height / 2.5,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          itemBuilder: (context, index) {
            return AnimationClick(
              child: Container(
                width: width - 24,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            items[index]['image'],
                            width: width - 24,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            items[index]['tag'],
                            style: caption1(color: grey1100),
                          ),
                        ),
                        Text(
                          items[index]['title'],
                          style: headline(color: grey1100),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          items[index]['time'],
                          style: subhead(color: grey400),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          items[index]['description'],
                          style: body(color: grey1100),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 4,
              ),
          itemCount: items.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
    return PopScope(
      canPop: false,
      child: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          if (state is FeedLoadingState || state is FeedInitialState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is FeedFailureState) {
            return Scaffold(
              body: Center(
                child: Text(state.error.toString()),
              ),
            );
          } else if (state is FeedsSuccessState) {
            return Scaffold(
              appBar: AppBarCpn(
                left: AnimationClick(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        equals,
                        width: 28,
                        height: 28,
                        color: grey1100,
                      ),
                    ),
                  ),
                ),
                center: Image.asset(logo, width: 40, height: 40),
                right: Row(
                  children: [
                    AnimationClick(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            bookmark_simple,
                            width: 28,
                            height: 28,
                            color: grey1100,
                          ),
                        ),
                      ),
                    ),
                    AnimationClick(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            icSearch,
                            width: 28,
                            height: 28,
                            color: grey1100,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppWidget.divider(context, color: grey200, vertical: 0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        children: [
                          //TODO: TO BE REMOVED LATER WHEN THE CORRECT USER FLOW IS DONE
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (prefManager.userType == 'User A')
                                  Expanded(child: userALogoutBloc()),
                                if (prefManager.userType == 'User B')
                                  Expanded(child: userBLogoutBloc()),
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(Routes.settingsScreen);
                                  },
                                  icon: const Icon(
                                    Icons.settings,
                                    color: grey1100,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(Routes.profilesLanding);
                                    },
                                    icon: const Icon(
                                      Icons.people_outline,
                                      color: grey1100,
                                      size: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child:
                                      itemCoin(coin1, '5.23', '+0.18%', green)),
                              Expanded(
                                  child:
                                      itemCoin(coin2, '1.46', '+0.1%', green)),
                              Expanded(
                                  child: itemCoin(
                                      coin3, '0.004', '-0.8%', radicalRed1)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppWidget.divider(context, color: grey200, vertical: 0),
                    BlocBuilder<NotificationBloc, NotificationState>(
                      builder: (context, state) {
                        return item('An Introduction to the Art of the Future',
                            'February 29, 2012', reading_interest_2);
                      },
                    ),
                    const SizedBox(height: 4),
                    item('Art Should Be Seen.', 'February 29, 2012',
                        main_seller_2),
                    const SizedBox(height: 24),
                    buildTabBar(),
                    //TODO: THIS IS CAUSING ISSUE WITH THE LAYOUT
                    SizedBox(
                      height: state.feeds.isEmpty ? 100 : 500,
                      child: state.feeds.isEmpty
                          ? Text(
                              'There is no feed right now',
                              style: headline(color: grey1100),
                            )
                          : ListView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              itemCount: state.feeds.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AnimationClick(
                                    child: Container(
                                      height: 400,
                                      width: width - 24,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: grey200,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              child: Image.asset(
                                                main_seller_1,
                                                width: width - 24,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 12),
                                                decoration: BoxDecoration(
                                                    color: primary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Text(
                                                  'Tag',
                                                  style:
                                                      caption1(color: grey1100),
                                                ),
                                              ),
                                              Text(
                                                state.feeds[index].newsExcerpt,
                                                style:
                                                    headline(color: grey1100),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                state.feeds[index]
                                                    .dateAuthorered,
                                                style: subhead(color: grey400),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                state.feeds[index].newsContent,
                                                style: body(color: grey1100),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    const SizedBox(height: 8),
                    const Podcast()
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  BlocConsumer<AuthenticationBlocB, AuthenticationBState> userBLogoutBloc() {
    return BlocConsumer<AuthenticationBlocB, AuthenticationBState>(
      listener: (context, state) {
        if (state is UserBLogoutSuccessState) {
          Utils.snackBar(context, message: 'Logout Success');

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.onBoarding1, (route) => false);
          });
        } else if (state is UserBLogoutFailureState) {
          Utils.snackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is UserBLogoutLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserBLogoutSuccessState) {
          return Container();
        } else {
          return AppWidget.typeButtonStartAction2(
              context: context,
              input: 'Logout',
              onPressed: () {
                BlocProvider.of<AuthenticationBlocB>(context)
                    .add(UserBLogoutEvent());
              },
              bgColor: primary,
              borderColor: primary,
              textColor: grey1100);
        }
      },
    );
  }

  BlocConsumer<AuthenticationBloc, AuthenticationState> userALogoutBloc() {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          Utils.snackBar(context, message: 'Logout Success');

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.onBoarding1, (route) => false);
          });
        } else if (state is LogoutFailureState) {
          Utils.snackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is LogoutLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LogoutSuccessState) {
          return Container();
        } else {
          return AppWidget.typeButtonStartAction2(
              context: context,
              input: 'Logout',
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LogoutEvent());
              },
              bgColor: primary,
              borderColor: primary,
              textColor: grey1100);
        }
      },
    );
  }

  SizedBox buildTabBar() {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return AnimationClick(
            function: () {
              setState(() {
                selected = index;
              });
            },
            child: GradientText(
              tabs[index],
              style: const TextStyle(
                fontSize: 20,
                height: 1.2,
                fontWeight: FontWeight.w700,
                fontFamily: 'SpaceGrotesk',
              ),
              gradient: LinearGradient(
                colors: selected == index
                    ? [
                        const Color(0xFFCFE1FD).withOpacity(0.9),
                        const Color(0xFFFFFDE1).withOpacity(0.9),
                      ]
                    : [
                        grey1100.withOpacity(0.3),
                        grey1100.withOpacity(0.3),
                      ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemCount: tabs.length,
      ),
    );
  }
}

class FeedScreenPage extends StatefulWidget {
  const FeedScreenPage({super.key});

  @override
  State<FeedScreenPage> createState() => _FeedScreenPageState();
}

class _FeedScreenPageState extends State<FeedScreenPage> {
  BlocConsumer<AuthenticationBlocB, AuthenticationBState> userBLogoutBloc() {
    return BlocConsumer<AuthenticationBlocB, AuthenticationBState>(
      listener: (context, state) {
        if (state is UserBLogoutSuccessState) {
          Utils.snackBar(context, message: 'Logout Success');

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.onBoarding1, (route) => false);
          });
        } else if (state is UserBLogoutFailureState) {
          Utils.snackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is UserBLogoutLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserBLogoutSuccessState) {
          return Container();
        } else {
          return AppWidget.typeButtonStartAction2(
              context: context,
              input: 'Logout',
              onPressed: () {
                BlocProvider.of<AuthenticationBlocB>(context)
                    .add(UserBLogoutEvent());
              },
              bgColor: primary,
              borderColor: primary,
              textColor: grey1100);
        }
      },
    );
  }

  BlocConsumer<AuthenticationBloc, AuthenticationState> userALogoutBloc() {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          Utils.snackBar(context, message: 'Logout Success');

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.onBoarding1, (route) => false);
          });
        } else if (state is LogoutFailureState) {
          Utils.snackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is LogoutLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LogoutSuccessState) {
          return Container();
        } else {
          return AppWidget.typeButtonStartAction2(
            context: context,
            input: 'Logout',
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LogoutEvent());
            },
            bgColor: primary,
            borderColor: primary,
            textColor: grey1100,
          );
        }
      },
    );
  }

  List<String> listWidget = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    listWidget = [
      Routes.feedPage,
      Routes.feedPage,
      Routes.feedPage,
      Routes.profilesLanding,
    ];
    context
        .read<AdminNotificationBloc>()
        .add(GetAdminNotificationsEvent(chatId: '', senderId: ''));
    context.read<FeedBloc>().add(GetFeedsEvent());
    context.read<NotificationBloc>().add(
          GetUserNotificationsEvent(chatId: '', senderId: ''),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: grey300,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (value) {
              setState(() {
                if (_currentIndex != value && value != 1 && value != 2) {
                  _currentIndex = value;
                  Future.delayed(Duration.zero, () {
                    Navigator.of(context).pushNamed(listWidget[value]);
                  });
                }
              });
            },
            items: [
              AppWidget.createItemNav(
                  context, houseSimple, houseSimple, 'House Simple',
                  hasContainer: true),
              AppWidget.createItemNav(
                  context, calendarBlank, calendarBlank, 'Calendar',
                  hasContainer: true),
              AppWidget.createItemNav(context, timer, timer, 'Timer',
                  hasContainer: true),
              AppWidget.createItemNav(context, user, user, 'User',
                  hasContainer: true),
            ],
          ),
        ),
      ),
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                equals,
                width: 28,
                height: 28,
                color: grey1100,
              ),
            ),
          ),
        ),
        center: Image.asset(logo, width: 40, height: 40),
        right: Row(
          children: [
            AnimationClick(
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    bookmark_simple,
                    width: 28,
                    height: 28,
                    color: grey1100,
                  ),
                ),
              ),
            ),
            AnimationClick(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    icSearch,
                    width: 28,
                    height: 28,
                    color: grey1100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            primary: true,
            pinned: true,
            expandedHeight: 140,
            collapsedHeight: 140,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  AppWidget.divider(context, color: grey200, vertical: 0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (prefManager.userType == 'User A')
                          Expanded(child: userALogoutBloc()),
                        if (prefManager.userType == 'User B')
                          Expanded(child: userBLogoutBloc()),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(Routes.settingsScreen);
                          },
                          icon: const Icon(
                            Icons.settings,
                            color: grey1100,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.profilesLanding);
                            },
                            icon: const Icon(
                              Icons.people_outline,
                              color: grey1100,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: ItemIcon(
                        icon: coin1,
                        money: '5.23',
                        rate: '+0.18%',
                        color: green,
                      )),
                      Expanded(
                          child: ItemIcon(
                              icon: coin2,
                              money: '1.46',
                              rate: '+0.1%',
                              color: green)),
                      Expanded(
                        child: ItemIcon(
                            icon: coin3,
                            money: '0.004',
                            rate: '-0.8%',
                            color: radicalRed1),
                      ),
                    ],
                  ),
                  AppWidget.divider(context, color: grey200, vertical: 0),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  BlocBuilder<AdminNotificationBloc, AdminNotificationState>(
                builder: (context, state) {
                  if (state is AdminNotificationLoadingState) {
                    return const Column(
                      children: [
                        Text('Loading Admin Notifications'),
                        CircularProgressIndicator(),
                      ],
                    );
                  } else if (state is AdminNotificationFailureState) {
                    return Column(
                      children: [
                        const Text(
                            "Sorry we couldn't load admin notifications now"),
                        TextButton(
                          child: const Text('Retry'),
                          onPressed: () {},
                        )
                      ],
                    );
                  } else if (state is AdminNotificationSuccessState) {
                    return Column(
                      children: [
                        AdminNotificaton(
                          title: state.adminNotifications[index].notification,
                          time: state.adminNotifications[index].date,
                          image: reading_interest_2,
                        ),
                        const SizedBox(height: 4),
                      ],
                    );
                  }
                  return const Text('');
                },
              ),
              childCount: _calculateAdminNotificationChildCount(context),
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 24),
                SizedBox(height: 20),
                BuildTabBar(),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => BlocBuilder<FeedBloc, FeedState>(
                builder: (context, state) {
                  if (state is FeedLoadingState) {
                    return const Column(
                      children: [
                        Text('Loading Feed'),
                        CircularProgressIndicator(),
                      ],
                    );
                  } else if (state is FeedFailureState) {
                    return Column(
                      children: [
                        const Text("Sorry we couldn't load your feed now"),
                        TextButton(
                          child: const Text('Retry'),
                          onPressed: () {},
                        )
                      ],
                    );
                  } else if (state is FeedsSuccessState) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimationClick(
                        child: Container(
                          height: 400,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: grey200,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    main_seller_1,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 12),
                                    decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'Tag',
                                      style: caption1(color: grey1100),
                                    ),
                                  ),
                                  Text(
                                    state.feeds[index].newsExcerpt,
                                    style: headline(color: grey1100),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    state.feeds[index].dateAuthorered,
                                    style: subhead(color: grey400),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    state.feeds[index].newsContent,
                                    style: body(color: grey1100),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  return Text('');
                },
              ),
              childCount: _calculateFeedChildCount(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientText(
                    'Podcast',
                    style: const TextStyle(
                        fontSize: 22,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SpaceGrotesk'),
                    gradient: LinearGradient(colors: [
                      const Color(0xFFCFE1FD).withOpacity(0.9),
                      const Color(0xFFFFFDE1).withOpacity(0.9),
                    ]),
                  ),
                  AnimationClick(
                    child: Text(
                      'See All',
                      style: headline(color: primary),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state is NotificationLoadingState) {
                    return const Column(
                      children: [
                        Text('Loading User Notifications'),
                        CircularProgressIndicator(),
                      ],
                    );
                  } else if (state is UserNotificationFailureState) {
                    return Column(
                      children: [
                        const Text(
                            "Sorry we couldn't load admin notifications now"),
                        TextButton(
                          child: const Text('Retry'),
                          onPressed: () {},
                        )
                      ],
                    );
                  } else if (state is UserNotificationSuccessState) {
                    return Column(
                      children: [
                        UserNotificationWidget(
                          notification: state.userNotifications[index],
                        ),
                        const SizedBox(height: 4),
                      ],
                    );
                  }

                  return const Text('');
                },
              ),
              childCount: _calculateUserNotificationChildCount(context),
            ),
          ),
        ],
      ),
    );
  }

  int _calculateFeedChildCount(BuildContext context) {
    final state = context.watch<FeedBloc>().state;
    if (state is FeedLoadingState || state is FeedFailureState) {
      return 1;
    } else if (state is FeedsSuccessState) {
      return state.feeds.length;
    } else {
      return 0;
    }
  }

  int _calculateAdminNotificationChildCount(BuildContext context) {
    final state = context.watch<AdminNotificationBloc>().state;
    if (state is AdminNotificationLoadingState ||
        state is AdminNotificationFailureState) {
      return 1;
    } else if (state is AdminNotificationSuccessState) {
      return state.adminNotifications.length;
    } else {
      return 0;
    }
  }

  int _calculateUserNotificationChildCount(BuildContext context) {
    final state = context.watch<NotificationBloc>().state;
    if (state is NotificationLoadingState ||
        state is UserNotificationFailureState) {
      return 1;
    } else if (state is UserNotificationSuccessState) {
      return state.userNotifications.length;
    } else {
      return 0;
    }
  }
}
