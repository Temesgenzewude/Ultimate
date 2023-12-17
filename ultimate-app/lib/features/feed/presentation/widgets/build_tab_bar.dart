
import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';
import 'package:flutter_ultimate/common/widget/gradient_text.dart';

class BuildTabBar extends StatefulWidget {
  const BuildTabBar({super.key});

  @override
  State<BuildTabBar> createState() => _BuildTabBarState();
}

class _BuildTabBarState extends State<BuildTabBar> {
  int selected = 0;
  List<String> tabs = ['Hot Today', 'Trending', 'Popular'];
  @override
  Widget build(BuildContext context) {
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