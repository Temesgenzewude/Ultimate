import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/item_review.dart';

List<Map<String, dynamic>> reviews = [
  <String, dynamic>{
    'title': 'Consumer Banking and Payments',
    'name': 'Albert Flores',
    'time': '15 mins ago',
    'content':
        'Why would I want to trade an Event Contract over another asset class?',
    'rate': 4.5,
    'images': [imagePost1, homeSocial1, homeSocial2]
  },
  <String, dynamic>{
    'title': 'Consumer Banking and Payments',
    'name': 'Albert Flores',
    'time': '15 mins ago',
    'content':
        'Why would I want to trade an Event Contract over another asset class?',
    'rate': 4.5,
    'images': [imagePost1, homeSocial1, homeSocial2]
  }
];

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  double ratingBar = 4.5;

  Widget ratingbar({bool bigger = true}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:
          bigger ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '$ratingBar',
            style: bigger ? header(color: corn1) : title3(color: corn1),
          ),
        ),
        const SizedBox(width: 4),
        RatingBar(
          ratingWidget: RatingWidget(
              full: Image.asset(
                starFill,
              ),
              half: Image.asset(
                starHalf,
              ),
              empty: Image.asset(
                starOutline,
              )),
          initialRating: ratingBar,
          minRating: 0,
          maxRating: 5,
          itemSize: bigger ? 32 : 20,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 3),
          onRatingUpdate: (rating) {
            setState(() {
              ratingBar = rating;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
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
        right: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: AnimationClick(
            child: Image.asset(
              dotsSix,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '246 Review',
                  style: title2(color: grey1100),
                ),
                const SizedBox(height: 16),
                ratingbar(),
                AnimationClick(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      children: [
                        Image.asset(
                          hand51,
                          width: 64,
                          height: 64,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GradientText(
                                'Leave Review',
                                style: const TextStyle(
                                    fontSize: 20,
                                    height: 1.5,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'SpaceGrotesk'),
                                gradient: LinearGradient(colors: [
                                  const Color(0xFFCFE1FD).withOpacity(0.9),
                                  const Color(0xFFFFFDE1).withOpacity(0.9),
                                ]),
                              ),
                              ratingbar(bigger: false)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height / 2,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: reviews.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) => AnimationClick(
                child: ItemReview(review: reviews[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
