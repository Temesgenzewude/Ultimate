import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/features/profiles/presentation/screens/profile_screen.dart';
import 'package:shimmer/shimmer.dart';

class ImageSliderWidget extends StatelessWidget {
  const ImageSliderWidget({
    super.key,
    required this.height,
    required PageController pageController,
    required this.widget,
    required this.width,
  }) : _pageController = pageController;

  final double height;
  final PageController _pageController;
  final ProfileScreen widget;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 1.5,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: grey200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.userBProfile.userImages.length,
        onPageChanged: (value) {},
        itemBuilder: (context, index) {
          return widget.userBProfile.userImages[index] == ''
              ? Image.asset(
                  bgProfile8,
                  height: height / 1.5,
                  width: width,
                  fit: BoxFit.fill,
                )
              : Image.network(
                  widget.userBProfile.userImages[index],
                  height: height / 1.5,
                  width: width,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Shimmer.fromColors(
                      baseColor: const Color.fromARGB(195, 224, 224, 224),
                      highlightColor: const Color.fromARGB(125, 189, 189, 189),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.grey, // Shimmer for image
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
