import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/styles.dart';

class AdminNotificaton extends StatelessWidget {
  const AdminNotificaton({super.key, required this.title, required this.time, required this.image});
  final String title;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(horizontal: 4),
    decoration:
        BoxDecoration(color: grey200, borderRadius: BorderRadius.circular(16)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: headline(color: grey1100),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: caption1(color: grey600),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            image,
            width: 80,
            height: 64,
            fit: BoxFit.cover,
          ),
        )
      ],
    ),
  );
  }
}
