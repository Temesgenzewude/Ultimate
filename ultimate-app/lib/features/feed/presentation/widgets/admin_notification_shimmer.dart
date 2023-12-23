import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:shimmer/shimmer.dart';

class AdminNotificationShimmer extends StatelessWidget {
  const AdminNotificationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(16)),
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(205, 224, 224, 224),
        highlightColor: Color.fromARGB(135, 189, 189, 189),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 16, // Approximate height for title
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 140,
                    height: 14, // Approximate height for time
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 80,
                height: 64,
                color: Colors.grey, // Shimmer for image
              ),
            )
          ],
        ),
      ),
    );
  }
}