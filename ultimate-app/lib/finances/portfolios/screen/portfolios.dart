import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, String>> items = [
  {
    'title': 'Money',
    'icon': icEntertainment,
    'balance': '\$5,680.00',
    'increase': '42.8',
    'percent': '0.5',
  },
  {
    'title': 'Saving',
    'icon': shield,
    'balance': '\$13,579.00',
    'increase': '62.8',
    'percent': '1.0'
  },
  {
    'title': 'Investment',
    'icon': icShopping,
    'balance': '\$246,800.00',
    'increase': '42.8',
    'percent': '0.5'
  },
  {
    'title': 'Money',
    'icon': icEntertainment,
    'balance': '\$5,680.00',
    'increase': '42.8',
    'percent': '0.5'
  },
];
List<Color> colors = [primary, green, emerald1];

class Portfolios extends StatefulWidget {
  const Portfolios({super.key});

  @override
  State<Portfolios> createState() => _PortfoliosState();
}

class _PortfoliosState extends State<Portfolios> {
  bool showBalance = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(24)),
            child: Image.asset(
              bracketsSquare,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        right: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                avtMale,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GradientText(
                    'Balance',
                    style: const TextStyle(
                        fontSize: 24,
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              showBalance ? '\$12,860.44' : '******',
              style: title3(color: showBalance ? grey1100 : grey600),
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) => AnimationClick(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      gradient: index == 0
                          ? LinearGradient(colors: [
                              const Color(0xFFCFE1FD).withOpacity(0.9),
                              const Color(0xFFFFFDE1).withOpacity(0.9),
                            ])
                          : null,
                      color: index == 0 ? null : colors[index - 1],
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            items[index]['title']!,
                            style: body(color: index == 0 ? grey200 : grey1100),
                          ),
                          Image.asset(
                            items[index]['icon']!,
                            width: 32,
                            height: 32,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index]['balance']!,
                            style:
                                title2(color: index == 0 ? grey100 : grey1100),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Balance',
                            style: body(
                                color: index == 0
                                    ? grey200.withOpacity(0.5)
                                    : grey1100.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            '+\$${items[index]['increase']} (${items[index]['percent']}%) today',
                            style:
                                subhead(color: index == 0 ? grey100 : grey1100),
                          ),
                          const SizedBox(width: 8),
                          Image.asset(
                            arrowUpRight,
                            width: 16,
                            height: 16,
                            color: index == 0 ? grey100 : grey1100,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
