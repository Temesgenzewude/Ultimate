import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:shimmer/shimmer.dart';

class UserNotificationShimmer extends StatelessWidget {
  const UserNotificationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: grey200),
      child: Shimmer.fromColors(
        baseColor: Color.fromARGB(147, 224, 224, 224),
        highlightColor: Color.fromARGB(227, 189, 189, 189),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 80,
                height: 80,
                color: Colors.grey, // Shimmer for image
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 160,
                    height: 16, // Approximate height for notification text
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 130, // Approximate width for date
                        height: 13, // Approximate height for date
                        color: Colors.grey,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: green.withOpacity(0.5), // Shimmer for icon
                            borderRadius: BorderRadius.circular(24)),
                        child: Container(
                          width: 16,
                          height: 16,
                          color: Colors.grey, // Shimmer for icon placeholder
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
