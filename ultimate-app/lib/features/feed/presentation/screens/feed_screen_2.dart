import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/app/widget_support.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/common/constant/styles.dart';
import 'package:flutter_ultimate/common/route/routes.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';
import 'package:flutter_ultimate/common/widget/app_bar_cpn.dart';
import 'package:flutter_ultimate/common/widget/gradient_text.dart';
import 'package:flutter_ultimate/common/widget/loading_widget.dart';
import 'package:flutter_ultimate/features/feed/domain/entities/feed_entity.dart';
import 'package:flutter_ultimate/features/feed/presentation/bloc/admin_notification_bloc.dart';
import 'package:flutter_ultimate/features/feed/presentation/bloc/feed_bloc.dart';
import 'package:flutter_ultimate/features/feed/presentation/bloc/notification_bloc.dart';
import 'package:flutter_ultimate/features/feed/presentation/widgets/admin_notification_shimmer.dart';
import 'package:flutter_ultimate/features/feed/presentation/widgets/admin_notification_widget.dart';
import 'package:flutter_ultimate/features/feed/presentation/widgets/build_tab_bar.dart';
import 'package:flutter_ultimate/features/feed/presentation/widgets/feed_shimmer.dart';
import 'package:flutter_ultimate/features/feed/presentation/widgets/item_coin.dart';
import 'package:flutter_ultimate/features/feed/presentation/widgets/user_notification_shimmer.dart';
import 'package:flutter_ultimate/features/feed/presentation/widgets/user_notification_widget.dart';
import 'package:flutter_ultimate/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:flutter_ultimate/subscription_injection.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// Shared Preference
final prefManager = sl<PrefManager>();

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int selected = 0;
  List<String> tabs = ['Hot Today', 'Trending', 'Popular'];

  List<String> listWidget = [];
  int _currentIndex = 0;
  // late bool viewAdminNotificaion;
  // late bool viewFeed;
  // late bool viewUserNotificaion;
  // late NotificationSettingsBloc _notificationSettingsBloc;
  @override
  void initState() {
    super.initState();
    // _notificationSettingsBloc = NotificationSettingsBloc();
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

  @override
  Widget build(BuildContext context) {
    // Get Height and Widgth of The Screen
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
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
      body: BlocBuilder<NotificationSettingsBloc, NotificationSettingsState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                primary: true,
                pinned: true,
                expandedHeight: 120,
                collapsedHeight: 120,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      AppWidget.divider(context, color: grey200, vertical: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ItemIcon(
                              icon: coin1,
                              money: '5.23',
                              rate: '+0.18%',
                              color: green,
                            ),
                          ),
                          Expanded(
                            child: ItemIcon(
                              icon: coin2,
                              money: '1.46',
                              rate: '+0.1%',
                              color: green,
                            ),
                          ),
                          Expanded(
                            child: ItemIcon(
                              icon: coin3,
                              money: '0.004',
                              rate: '-0.8%',
                              color: radicalRed1,
                            ),
                          ),
                          AppWidget.divider(context,
                              color: grey200, vertical: 0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: AppWidget.divider(context, color: grey200, vertical: 0),
              ),

              // Admin Notification
              if (state.adminNotificationVisibility)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => BlocBuilder<AdminNotificationBloc,
                        AdminNotificationState>(
                      builder: (context, state) {
                        if (state is AdminNotificationLoadingState) {
                          return const Column(
                            children: [
                              AdminNotificationShimmer(),
                              AdminNotificationShimmer()
                            ],
                          );
                        } else if (state is AdminNotificationFailureState) {
                          return Column(
                            children: [
                              const Text(
                                  "Sorry we couldn't load admin notifications now"),
                              TextButton(
                                child: const Text('Retry'),
                                onPressed: () {
                                  context.read<AdminNotificationBloc>().add(
                                        GetAdminNotificationsEvent(
                                            chatId: '', senderId: ''),
                                      );
                                },
                              )
                            ],
                          );
                        } else if (state is AdminNotificationSuccessState) {
                          return Column(
                            children: [
                              AdminNotificaton(
                                title: state
                                    .adminNotifications[index].notification,
                                time: state.adminNotifications.reversed
                                    .toList()[index]
                                    .date,
                                image: reading_interest_2,
                              ),
                              const SizedBox(height: 4),
                            ],
                          );
                        }
                        return const Text('');
                      },
                    ),
                    childCount:
                        _calculateAdminNotificationChildCount(context) > 2
                            ? 2
                            : _calculateAdminNotificationChildCount(context),
                  ),
                ),
              if (state.feedVisibility)
                const SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      BuildTabBar(),
                    ],
                  ),
                ),
              if (state.feedVisibility)
                SliverToBoxAdapter(
                  child: BlocBuilder<FeedBloc, FeedState>(
                    builder: (context, state) {
                      if (state is FeedLoadingState) {
                        return FeedShimmer();
                      } else if (state is FeedFailureState) {
                        return Column(
                          children: [
                            const Text("Sorry we couldn't load your feed now"),
                            TextButton(
                              child: const Text('Retry'),
                              onPressed: () {
                                context.read<FeedBloc>().add(GetFeedsEvent());
                              },
                            )
                          ],
                        );
                      } else if (state is FeedsSuccessState) {
                        List<FeedEntity> feeds = state.feeds.reversed.toList();
                        return SizedBox(
                          height: height / 2.5,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, index) {
                              return AnimationClick(
                                child: Container(
                                  width: width - 64,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: grey200,
                                      borderRadius: BorderRadius.circular(16)),
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
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 16),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 12),
                                            decoration: BoxDecoration(
                                                color: primary,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Text(
                                              'tag',
                                              style: caption1(color: grey1100),
                                            ),
                                          ),
                                          Text(
                                            feeds[index].newsExcerpt,
                                            style: headline(color: grey1100),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            feeds[index].dateAuthorered,
                                            style: subhead(color: grey400),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            feeds[index].newsContent,
                                            style: body(color: grey1100),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                            ),
                            itemCount: feeds.length,
                          ),
                        );
                      }

                      return const Text('');
                    },
                  ),
                ),
              if (state.userNotificationVisibility)
                SliverToBoxAdapter(
                  child: Builder(
                    builder: (context) {
                      final state = context.watch<NotificationBloc>().state;
                      if (state is UserNotificationSuccessState)
                        return Padding(
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
                                  fontFamily: 'SpaceGrotesk',
                                ),
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
                                function: () {
                                  Navigator.of(context).pushNamed(
                                    Routes.userNotificationsScreen,
                                    arguments: state.userNotifications.reversed
                                        .toList(),
                                  );
                                },
                              )
                            ],
                          ),
                        );
                      return Container();
                    },
                  ),
                ),
              if (state.userNotificationVisibility)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        BlocBuilder<NotificationBloc, NotificationState>(
                      builder: (context, state) {
                        if (state is NotificationLoadingState) {
                          return const UserNotificationShimmer();
                        } else if (state is UserNotificationFailureState) {
                          return Column(
                            children: [
                              const Text(
                                  "Sorry we couldn't load admin notifications now"),
                              TextButton(
                                child: const Text('Retry'),
                                onPressed: () {
                                  context.read<NotificationBloc>().add(
                                      GetUserNotificationsEvent(
                                          chatId: '', senderId: ''));
                                },
                              )
                            ],
                          );
                        } else if (state is UserNotificationSuccessState) {
                          return Column(
                            children: [
                              UserNotificationWidget(
                                notification: state.userNotifications.reversed
                                    .toList()[index],
                              ),
                              const SizedBox(height: 4),
                            ],
                          );
                        }

                        return const Text('');
                      },
                    ),
                    childCount:
                        _calculateUserNotificationChildCount(context) > 4
                            ? 4
                            : _calculateUserNotificationChildCount(context),
                  ),
                ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 110,
                ),
              )
            ],
          );
        },
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
