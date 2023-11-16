import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/unfocus_click.dart';

List<Map<String, dynamic>> friends = [
  <String, dynamic>{
    'avt': friend_1,
    'name': 'Floyd Miles',
    'mutual': 1,
  },
  <String, dynamic>{
    'avt': friend_2,
    'name': 'Guy Hawkins',
    'mutual': 1,
  },
  <String, dynamic>{
    'avt': friend_3,
    'name': 'Leslie Alexander',
    'mutual': 1,
  },
  <String, dynamic>{
    'avt': friend_4,
    'name': 'Darlene Robertson',
    'mutual': 1,
  },
  <String, dynamic>{
    'avt': friend_5,
    'name': 'Jacob Jones',
    'mutual': 1,
  }
];

List<Map<String, dynamic>> invites = [
  <String, dynamic>{
    'avt': friend_5,
    'name': 'Jacob Jones',
    'mutual': 1,
  },
  <String, dynamic>{
    'avt': avtMale4,
    'name': 'Floyd Miles',
    'mutual': 1,
  },
  <String, dynamic>{
    'avt': avtMale5,
    'name': 'Guy Hawkins',
    'mutual': 1,
  },
  <String, dynamic>{
    'avt': friend_3,
    'name': 'Leslie Alexander',
    'mutual': 1,
  },
  <String, dynamic>{
    'avt': avtMale8,
    'name': 'Darlene Robertson',
    'mutual': 1,
  },
];

class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  int _currentIndex = 0;
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();

  OutlineInputBorder createInputDecoration(BuildContext context,
      {Color? color}) {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: grey1100, width: 2),
        borderRadius: BorderRadius.circular(16));
  }

  Widget items(List<Map<String, dynamic>> items) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 32),
      itemBuilder: (context, index) => AnimationClick(
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(items[index]['avt']!),
              radius: 32,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index]['name']!,
                        style: headline(color: grey1000),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${items[index]['mutual']!} mutual goals',
                        style: subhead(color: grey700),
                      ),
                    ],
                  ),
                  AnimationClick(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(32)),
                      child: const Icon(
                        Icons.add,
                        size: 24,
                        color: grey1100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusClick(
      child: Scaffold(
        backgroundColor: primary,
        appBar: AppBarCpn(
          left: AnimationClick(
            function: () {
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: grey1100,
              ),
            ),
          ),
          center: Text(
            'Friends',
            style: headline(color: grey1100),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: AppWidget.typeButtonStartAction(
              context: context,
              input: 'Invite Friends Your Goal',
              onPressed: () {},
              bgColor: primary,
              borderColor: primary,
              textColor: grey1100),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Friends',
                    style: title2(color: grey1100),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                      textAlignVertical: TextAlignVertical.center,
                      controller: searchCtl,
                      focusNode: searchFn,
                      onSubmitted: (value) {},
                      style: body(color: grey1100),
                      decoration: InputDecoration(
                        hintText: 'Your friend emails',
                        hintStyle: body(color: grey900),
                        fillColor: primary,
                        filled: true,
                        contentPadding: const EdgeInsets.all(18),
                        suffixIcon: AnimationClick(
                          function: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Image.asset(
                              icArrowRight,
                              height: 24,
                              width: 24,
                              color: grey1100,
                            ),
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minHeight: 16,
                          minWidth: 16,
                        ),
                        focusedBorder:
                            createInputDecoration(context, color: emerald1),
                        enabledBorder: createInputDecoration(context),
                        errorBorder:
                            createInputDecoration(context, color: radicalRed1),
                        enabled: true,
                      )),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                    color: grey100,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AnimationClick(
                          function: () {
                            setState(() {
                              _currentIndex = 0;
                            });
                          },
                          child: Text(
                            'List Friends',
                            style: title4(
                                color: _currentIndex == 0 ? grey1100 : grey600),
                          ),
                        ),
                        const SizedBox(width: 16),
                        AnimationClick(
                          function: () {
                            setState(() {
                              _currentIndex = 1;
                            });
                          },
                          child: Text(
                            'Invites',
                            style: title4(
                                color: _currentIndex == 1 ? grey1100 : grey600),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (_currentIndex == 0) ...[
                      Expanded(child: items(friends))
                    ],
                    if (_currentIndex == 1) ...[Expanded(child: items(invites))]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
