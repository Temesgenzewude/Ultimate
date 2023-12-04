import 'package:flutter/material.dart';
import '../../../../app/widget_support.dart';
import '../../../../common/constant/colors.dart';
import '../../../../common/constant/images.dart';
import '../../../../common/constant/styles.dart';
import '../../../../common/widget/animation_click.dart';

List<String> badges = [trophy1, trophy2, trophy3, trophy4, trophy5];
List<String> portfolios = [bgProfile21, bgProfile22, bgProfile21, bgProfile22];

class ProfileTwo extends StatelessWidget {
  const ProfileTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(
          context: context,
          hasLeading: false,
          onTap: () {},
          action: Image.asset(
            gearSix,
            width: 24,
            height: 24,
            color: grey1100,
          )),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(48),
                      child: Image.asset(
                        avtFemale,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Albert Flores',
                            style: title3(color: grey1100),
                          ),
                        ),
                        Text(
                          'UI/UX Designer',
                          style: body(color: grey800),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24, bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: grey200, borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '230K',
                            style: title2(color: grey1100),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Follower',
                            style: subhead(color: grey800),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '498',
                            style: title2(color: grey1100),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Project',
                            style: subhead(color: grey800),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 32),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppWidget.typeButtonStartAction2(
                            context: context,
                            input: 'Follow',
                            onPressed: () {},
                            icon: addUser,
                            sizeAsset: 24,
                            colorAsset: corn1,
                            bgColor: grey200.withOpacity(0.3),
                            borderColor: grey200.withOpacity(0.3),
                            textColor: corn1),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AppWidget.typeButtonStartAction2(
                            context: context,
                            input: 'Hire Me',
                            onPressed: () {},
                            icon: briefcase,
                            sizeAsset: 24,
                            bgColor: primary,
                            borderColor: primary,
                            textColor: grey1100),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Image.asset(giphy, width: 32, height: 32),
                    ),
                    Text(
                      'Achievement Badge',
                      style: title4(color: grey1100),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 32),
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AnimationClick(
                        child: Container(
                          width: 80,
                          height: 80,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: grey200,
                              borderRadius: BorderRadius.circular(48)),
                          child: Image.asset(
                            badges[index],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 16,
                      ),
                  itemCount: badges.length),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(achievement, width: 24, height: 24),
                const SizedBox(width: 8),
                Text(
                  'Portfolios',
                  style: title4(color: grey1100),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 8),
            child: SizedBox(
              height: 150,
              child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AnimationClick(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          child: Image.asset(
                            portfolios[index],
                            height: 150,
                            width: 200,
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                  itemCount: portfolios.length),
            ),
          ),
        ],
      ),
    );
  }
}
