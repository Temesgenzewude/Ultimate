import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';

class ItemReview extends StatelessWidget {
  const ItemReview({Key? key, required this.review}) : super(key: key);
  final Map<String, dynamic> review;

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Container(
      width: width / 1.2,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: grey200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  initialRating: review['rate'],
                  minRating: 0,
                  maxRating: 5,
                  itemSize: 24,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 3),
                  onRatingUpdate: (double value) {},
                ),
                const SizedBox(height: 24),
                GradientText(
                  review['title'],
                  style: const TextStyle(
                      fontSize: 28,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: RichText(
                    text: TextSpan(
                      text: review['name'],
                      style: headline(color: grey1100),
                      children: <TextSpan>[
                        TextSpan(
                          text: '  -  ',
                          style: subhead(color: grey800),
                        ),
                        TextSpan(
                          text: review['time'],
                          style: subhead(color: grey800),
                        )
                      ],
                    ),
                  ),
                ),
                Text(review['content'], style: body(color: grey1100)),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => AnimationClick(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          review['images'][index],
                          width: width / 3,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                itemCount: review['images'].length),
          )
        ],
      ),
    );
  }
}
