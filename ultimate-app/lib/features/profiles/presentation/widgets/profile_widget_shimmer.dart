import 'package:flutter/material.dart';
import 'package:flutter_ultimate/app/widget_support.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: grey300, borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(16),
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(195, 224, 224, 224),
        highlightColor: const Color.fromARGB(125, 189, 189, 189),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey, // Shimmer for image
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 14, // Approximate text height
                        color: Colors.grey, // Shimmer for title
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 40,
                              height: 14, // Approximate text height
                              color: Colors.grey, // Shimmer for "from"
                            ),
                            Container(
                              width: 60,
                              height: 14, // Approximate text height
                              color: Colors.grey, // Shimmer for balance
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 14, // Approximate text height
                            color: Colors.grey, // Shimmer for star rating
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              width: 60,
                              height: 14, // Approximate text height
                              color: Colors.grey, // Shimmer for distance
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppWidget.divider(context, vertical: 16, color: grey400),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          width: 80,
                          height: 16, // Approximate row height
                          color: Colors.grey, // Shimmer for counts
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 40, // Approximate button height
                    decoration: BoxDecoration(
                      color: primary.withOpacity(0.5), // Shimmer for button
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
