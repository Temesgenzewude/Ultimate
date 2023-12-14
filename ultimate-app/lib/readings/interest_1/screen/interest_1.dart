import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/features/authentication/presentation/bloc/store_user_interests/store_user_interests_bloc.dart';
import 'package:flutter_ultimate/features/authentication/presentation/screens/add_mobile_number/add_mobile_number.dart';

import 'package:flutter_ultimate/common/util/show_toast_message.dart';
import 'package:flutter_ultimate/features/authentication/data/models/save_user_interests_request_model.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

class Interest1 extends StatefulWidget {
  const Interest1({Key? key}) : super(key: key);

  @override
  State<Interest1> createState() => _Interest1State();
}

class _Interest1State extends State<Interest1> {
  List<Map<String, dynamic>> items = [
    <String, dynamic>{
      'id': 1,
      'title': 'Brainstorm',
      'icon': '❤️️',
      'image': reading_interest_1,
      'selected': false
    },
    <String, dynamic>{
      'id': 2,
      'title': 'Life Style',
      'icon': '🛵️️',
      'image': reading_interest_2,
      'selected': false
    },
    <String, dynamic>{
      'id': 3,
      'title': 'Interior',
      'icon': '🛵️',
      'image': reading_interest_3,
      'selected': false
    },

    <String, dynamic>{
      'id': 6,
      'title': 'Technology',
      'icon': '👻️',
      'image': reading_interest_6,
      'selected': false
    },
    <String, dynamic>{
      'id': 7,
      'title': 'Space',
      'icon': '😈️',
      'image': reading_interest_7,
      'selected': false
    },
    <String, dynamic>{
      'id': 8,
      'title': 'Art & Design',
      'icon': '❤️',
      'image': reading_interest_8,
      'selected': false
    },
    <String, dynamic>{
      'id': 9,
      'title': 'Music',
      'icon': '🎹️',
      'image': reading_interest_9,
      'selected': false
    },
    <String, dynamic>{
      'id': 10,
      'title': 'Photography',
      'icon': '📷',
      'image': reading_interest_10,
      'selected': false
    },
    <String, dynamic>{
      'id': 11,
      'title': 'Cooking',
      'icon': '🍳',
      'image': reading_interest_10,
      'selected': false
    },
    <String, dynamic>{
      'id': 12,
      'title': 'Travel',
      'icon': '✈️',
      'image': reading_interest_9,
      'selected': false
    },
    <String, dynamic>{
      'id': 13,
      'title': 'Reading',
      'icon': '📚',
      'image': reading_interest_8,
      'selected': false
    },
    <String, dynamic>{
      'id': 14,
      'title': 'Volunteering',
      'icon': '🤝',
      'image': reading_interest_7,
      'selected': false
    },
    <String, dynamic>{
      'id': 15,
      'title': 'Sports',
      'icon': '⚽️',
      'image': reading_interest_6,
      'selected': false
    },
    <String, dynamic>{
      'id': 16,
      'title': 'Fashion',
      'icon': '👗',
      'image': reading_interest_5,
      'selected': false
    },
    <String, dynamic>{
      'id': 17,
      'title': 'Writing',
      'icon': '📝',
      'image': reading_interest_4,
      'selected': false
    },
    // Add more interests as needed
  ];

  List<Map<String, dynamic>> itemsSelected = [];
  @override
  void initState() {
    // prefManager.lastViewedPage = Routes.interest_1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        // appBar: AppBarCpn(
        //   // right: AnimationClick(
        //   //   child: Padding(
        //   //     padding: const EdgeInsets.only(right: 16),
        //   //     child: Text(
        //   //       'Skip',
        //   //       style: headline(color: corn1),
        //   //     ),
        //   //   ),
        //   //   function: () {
        //   //     Navigator.of(context).pushNamed(Routes.feedPage);
        //   //   },
        //   // ),
        // ),
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 8),
          child: BlocConsumer<StoreUserInterestsBloc, StoreUserInterestsState>(
            listener: (context, state) {
              if (state is StoreUserInterestsSuccessState) {
                Utils.flutterToast(
                    'Your interests have been successfully saved!');
              } else if (state is StoreUserInterestsFailureState) {
                Utils.flutterToast(state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is StoreUserInterestsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is StoreUserInterestsSuccessState) {
                return AppWidget.typeButtonStartAction(
                    context: context,
                    input: 'CONTINUE TO FEEDS',
                    onPressed: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushNamed(context, Routes.feedPage);
                      });
                    },
                    bgColor: primary,
                    borderColor: primary,
                    textColor: grey1100);
              } else {
                return AppWidget.typeButtonStartAction(
                    context: context,
                    input: 'SAVE YOUR INTERESTS',
                    onPressed: () {
                      if (itemsSelected.length < 5) {
                        Utils.flutterToast(
                            'Please select at least 5 interests to continue');
                        return;
                      }

                      // Create a string with titles separated by a comma
                      final String selectedTitles = itemsSelected
                          .map<String>((item) => item['title'])
                          .join(', ');
                      print('Selected interests are: $selectedTitles');

                      final SaveUserInterestRequest saveUserInterestRequest =
                          SaveUserInterestRequest(userIntrests: selectedTitles);
                      BlocProvider.of<StoreUserInterestsBloc>(context).add(
                          StoreUserInterestsEventCall(
                              saveUserInterestRequest:
                                  saveUserInterestRequest));
                    },
                    bgColor: primary,
                    borderColor: primary,
                    textColor: grey1100);
              }
            },
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    'Personalize your feed',
                    style: const TextStyle(
                        fontSize: 28,
                        height: 1.2,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SpaceGrotesk'),
                    gradient: LinearGradient(colors: [
                      const Color(0xFFCFE1FD).withOpacity(0.9),
                      const Color(0xFFFFFDE1).withOpacity(0.9),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 16),
                    child: Text(
                      'Select 5 or more topic',
                      style: body(color: grey800),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                        itemsSelected.length,
                        (index) => AnimationClick(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: grey200,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      itemsSelected[index]['icon'],
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      itemsSelected[index]['title'],
                                      style: body(color: grey800),
                                    )
                                  ],
                                ),
                              ),
                            )),
                  )
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4),
              itemCount: items.length,
              itemBuilder: (context, index) => AnimationClick(
                function: () {
                  setState(() {
                    items[index]['selected'] = !items[index]['selected'];
                    if (items[index]['selected']) {
                      itemsSelected.add(items[index]);
                    } else {
                      itemsSelected.remove(items[index]);
                    }
                  });
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        Image.asset(
                          items[index]['image'],
                          fit: BoxFit.cover,
                          height: height / 4,
                          width: width / 3,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: height / 2,
                            width: width,
                            decoration: BoxDecoration(
                                gradient: Theme.of(context).colorLinearBottom),
                          ),
                        ),
                        Positioned(
                            left: 8,
                            bottom: 8,
                            child: Text(
                              items[index]['title'],
                              style: subhead(color: grey1100),
                            )),
                        if (items[index]['selected']) ...[
                          Positioned(
                              left: 14,
                              top: 14,
                              child: Image.asset(
                                subtract,
                                width: 20,
                                height: 20,
                              ))
                        ]
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
