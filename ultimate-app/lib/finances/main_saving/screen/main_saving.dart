import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../../chart_saving/widget/progress_bar.dart';

final List<Map<String, dynamic>> live = [
  <String, dynamic>{
    'icon': house_3d,
    'avatars': [avtMale12, avtMale13, avtMale14],
    'title': 'Travel anywhere',
    'time': '64 days left',
    'available': '\$1,246',
    'total': '\$2,000',
    'percent': 56,
    'bg': const Color(0xFF429DF0)
  },
  <String, dynamic>{
    'icon': ic_bus,
    'avatars': [avtMale6, avtMale7, avtMale8],
    'title': 'Travel anywhere',
    'time': '64 days left',
    'available': '\$1,246',
    'total': '\$2,000',
    'percent': 70,
    'bg': green
  },
  <String, dynamic>{
    'icon': noodles,
    'avatars': [avtMale6, avtMale7, avtMale8],
    'title': 'Travel anywhere',
    'time': '64 days left',
    'available': '\$1,246',
    'total': '\$2,000',
    'percent': 70,
    'bg': const Color(0xFFCE8ABC)
  },
  <String, dynamic>{
    'icon': house_3d,
    'avatars': [avtMale12, avtMale13, avtMale14],
    'title': 'Travel anywhere',
    'time': '64 days left',
    'available': '\$1,246',
    'total': '\$2,000',
    'percent': 56,
    'bg': const Color(0xFF429DF0)
  },
  <String, dynamic>{
    'icon': ic_bus,
    'avatars': [avtMale6, avtMale7, avtMale8],
    'title': 'Travel anywhere',
    'time': '64 days left',
    'available': '\$1,246',
    'total': '\$2,000',
    'percent': 70,
    'bg': green
  },
  <String, dynamic>{
    'icon': noodles,
    'avatars': [avtMale6, avtMale7, avtMale8],
    'title': 'Travel anywhere',
    'time': '64 days left',
    'available': '\$1,246',
    'total': '\$2,000',
    'percent': 70,
    'bg': const Color(0xFFCE8ABC)
  }
];

final List<Map<String, dynamic>> finish = [
  <String, dynamic>{
    'icon': ic_bus,
    'avatars': [avtMale6, avtMale7, avtMale8],
    'title': 'Travel anywhere',
    'time': '64 days left',
    'available': '\$1,246',
    'total': '\$2,000',
    'percent': 70,
    'bg': green
  },
  <String, dynamic>{
    'icon': noodles,
    'avatars': [avtMale6, avtMale7, avtMale8],
    'title': 'Travel anywhere',
    'time': '64 days left',
    'available': '\$1,246',
    'total': '\$2,000',
    'percent': 70,
    'bg': const Color(0xFFCE8ABC)
  },
  <String, dynamic>{
    'icon': house_3d,
    'avatars': [avtMale12, avtMale13, avtMale14],
    'title': 'Travel anywhere',
    'time': '64 days left',
    'available': '\$1,246',
    'total': '\$2,000',
    'percent': 56,
    'bg': const Color(0xFF429DF0)
  },
];

class MainSaving extends StatefulWidget {
  const MainSaving({super.key});

  @override
  State<MainSaving> createState() => _MainSavingState();
}

class _MainSavingState extends State<MainSaving> {
  bool showBalance = false;
  int _currentIndex = 0;
  Widget items(List<Map<String, dynamic>> goals) {
    final width = AppWidget.getWidthScreen(context);
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AnimationClick(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: goals[index]['bg'],
                  borderRadius: BorderRadius.circular(24)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        goals[index]['icon'],
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        height: 32,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, ind) => CircleAvatar(
                                backgroundImage:
                                    AssetImage(goals[index]['avatars'][ind])),
                            separatorBuilder: (context, index) =>
                                const SizedBox(),
                            itemCount: goals[index]['avatars'].length),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        goals[index]['title'],
                        style: callout(color: grey1100),
                      ),
                      Text(
                        '${goals[index]['percent']}%',
                        style: title4(color: grey1100),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ProgressBar(
                        width: width * goals[index]['percent'] / 100),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            goals[index]['available'],
                            style: headline(color: grey1100),
                          ),
                          Text(
                            '/' + goals[index]['total'],
                            style: headline(color: const Color(0xFFC1D7D7)),
                          ),
                        ],
                      ),
                      Text(
                        '${goals[index]['time']}',
                        style: subhead(color: grey1100),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
        itemCount: goals.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                avtMale12,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
        right: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: AnimationClick(
            child: Image.asset(
              bellSimple,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GradientText(
                    'Total balance',
                    style: const TextStyle(
                        fontSize: 18,
                        height: 1,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SpaceGrotesk'),
                    gradient: LinearGradient(colors: [
                      const Color(0xFFCFE1FD).withOpacity(0.9),
                      const Color(0xFFFFFDE1).withOpacity(0.9),
                    ]),
                  ),
                ),
                AnimationClick(
                    function: () {
                      setState(() {
                        showBalance = !showBalance;
                      });
                    },
                    child: Image.asset(
                      showBalance ? eye : eyeSlash,
                      width: 20,
                      height: 20,
                      color: grey600,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  showBalance ? '2.460 USD' : '******',
                  style: const TextStyle(
                      fontSize: 36,
                      height: 1,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: showBalance
                      ? LinearGradient(colors: [
                          const Color(0xFFCFE1FD).withOpacity(0.9),
                          const Color(0xFFFFFDE1).withOpacity(0.9),
                        ])
                      : const LinearGradient(colors: [grey400, grey400]),
                ),
                AnimationClick(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(99)),
                    child: Image.asset(
                      chartBar,
                      width: 16,
                      height: 16,
                      color: grey1100,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  'Yesterday saving: ',
                  style: footnote(color: grey600),
                ),
                Text(
                  '15USD',
                  style: footnote(color: grey1100),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 24),
              decoration: const BoxDecoration(
                  color: grey200,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Goal',
                        style: title4(color: grey1100),
                      ),
                      Row(
                        children: [
                          AnimationClick(
                            function: () {
                              setState(() {
                                _currentIndex = 0;
                              });
                            },
                            child: Text(
                              'Live',
                              style: title4(
                                  color: _currentIndex == 0 ? corn1 : grey600),
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
                              'Finish',
                              style: title4(
                                  color: _currentIndex == 1 ? corn1 : grey600),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  if (_currentIndex == 0) ...[
                    Expanded(
                      child: items(live),
                    )
                  ],
                  if (_currentIndex == 1) ...[
                    Expanded(
                      child: items(finish),
                    )
                  ]
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
