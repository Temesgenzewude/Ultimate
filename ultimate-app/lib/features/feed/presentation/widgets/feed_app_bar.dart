import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';
import 'package:flutter_ultimate/common/widget/app_bar_cpn.dart';

class FeedAppBar extends StatefulWidget {
  const FeedAppBar({super.key});

  @override
  State<FeedAppBar> createState() => _FeedAppBarState();
}

class _FeedAppBarState extends State<FeedAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBarCpn(
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
    );
  }
}
