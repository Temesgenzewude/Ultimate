import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          function: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              icArrowLeft,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        right: Row(
          children: [
            AnimationClick(
              child: Image.asset(
                shareNetwork,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AnimationClick(
                child: Image.asset(
                  bookmarksSimple,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
            child: RichText(
              text: TextSpan(
                text: 'Do I need preclearance for ',
                style: title1(color: grey1100),
                children: <TextSpan>[
                  TextSpan(
                    text: 'each trade',
                    style: title1(color: corn1),
                  ),
                  TextSpan(
                    text: '?',
                    style: title1(color: grey1100),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 24),
            child: AnimationClick(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePost1,
                  height: height / 3,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  'Simplify internal procedures and make financial reporting more transparent',
                  style: title3(color: grey1100),
                ),
                const SizedBox(height: 16),
                Text(
                  'Are employees at sellside institutions (banks, advisory firms, etc) or buyside institutions (private equity firms, hedge funds, etc) universally banned from trading Kalshi’s event contracts?',
                  style: body(color: grey1000),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      color: primary.withOpacity(0.1),
                      border: const Border(
                          left: BorderSide(color: primary, width: 4))),
                  child: GradientText(
                    'Why would I want to trade an Event Contract over another asset class?',
                    style: const TextStyle(
                        fontSize: 18, height: 1.5, fontFamily: 'SpaceGrotesk'),
                    gradient: LinearGradient(colors: [
                      const Color(0xFFCFE1FD).withOpacity(0.9),
                      const Color(0xFFFFFDE1).withOpacity(0.9),
                    ]),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: AnimationClick(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              imagePost1,
                              fit: BoxFit.cover,
                              height: 160,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: AnimationClick(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                homeSocial2,
                                fit: BoxFit.cover,
                                height: 160,
                              ),
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: AnimationClick(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              homeSocial1,
                              fit: BoxFit.cover,
                              height: 160,
                            ),
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Why are Kalshi’s Event contracts generally different from other instruments I’m banned from trading?',
                  style: body(color: grey1000),
                ),
                AnimationClick(
                  child: Container(
                    width: width,
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                        color: grey200, borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          'Tags',
                          style: const TextStyle(
                              fontSize: 18,
                              height: 1.5,
                              fontFamily: 'SpaceGrotesk'),
                          gradient: LinearGradient(colors: [
                            const Color(0xFFCFE1FD).withOpacity(0.9),
                            const Color(0xFFFFFDE1).withOpacity(0.9),
                          ]),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '1000screen, darkmode, template, ui, kit',
                          style: subhead(color: grey600),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
