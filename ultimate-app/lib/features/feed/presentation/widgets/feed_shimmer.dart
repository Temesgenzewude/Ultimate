import 'package:flutter/material.dart';
import 'package:flutter_ultimate/app/widget_support.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:shimmer/shimmer.dart';

class FeedShimmer extends StatelessWidget {
  const FeedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
    return SizedBox(
      height: height / 2.5,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemBuilder: (context, index) {
          return Container(
            width: width - 64,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            child: Shimmer.fromColors(
              baseColor: const Color.fromARGB(195, 224, 224, 224),
              highlightColor: const Color.fromARGB(125, 189, 189, 189),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: width - 24,
                        height: 200, // Adjust height as needed
                        color: Colors.grey, // Shimmer for image
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                            color: primary.withOpacity(0.5), // Shimmer for tag
                            borderRadius: BorderRadius.circular(12)),
                        child: Container(
                          width: 60, // Approximate width for tag
                          height: 14, // Approximate height for tag
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 16, // Approximate height for news excerpt
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 120, // Approximate width for date
                        height: 14, // Approximate height for date
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: 40, // Approximate height for news content
                        color: Colors.grey,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: 3,
      ),
    );
  }
}
