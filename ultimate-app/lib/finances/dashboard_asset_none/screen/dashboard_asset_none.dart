import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

class DashboardAssetNone extends StatelessWidget {
  const DashboardAssetNone({super.key});

  Widget function(Color bgColor, String icon, String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 28,
            height: 28,
            color: grey1100,
          ),
          const SizedBox(height: 9),
          Text(
            title,
            style: title4(color: grey1100),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        left: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimationClick(
                child: Row(
                  children: [
                    GradientText(
                      'All Wallet',
                      style: const TextStyle(
                          fontSize: 20,
                          height: 1,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SpaceGrotesk'),
                      gradient: LinearGradient(colors: [
                        const Color(0xFFCFE1FD).withOpacity(0.9),
                        const Color(0xFFFFFDE1).withOpacity(0.9),
                      ]),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 24,
                      color: grey800,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '0',
                style: title3(color: grey1100),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              fiatMoney1,
              width: 160,
              height: 160,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text('Empty history',
                textAlign: TextAlign.center, style: title3(color: grey1100)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text('Please create new wallet or add expense manual',
                textAlign: TextAlign.center, style: body(color: grey800)),
          ),
          const SizedBox(height: 24),
          AnimationClick(child: function(green, wallet, 'Create new wallet')),
          const SizedBox(height: 8),
          AnimationClick(
              child: function(primary, plus_circle_2, 'Add expense manual')),
        ],
      ),
    );
  }
}
