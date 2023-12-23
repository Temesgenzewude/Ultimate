import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/features/profiles/presentation/screens/profile_screen.dart';
import 'package:shimmer/shimmer.dart';

class MainProfileImage extends StatelessWidget {
  const MainProfileImage({
    super.key,
    required this.widget,
  });

  final ProfileScreen widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -48,
      left: 24,
      child: IgnorePointer(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: widget.userBProfile.imageUrl == ''
                  ? Image.asset(
                      avtFemale,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      widget.userBProfile.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Shimmer.fromColors(
                          baseColor: const Color.fromARGB(195, 224, 224, 224),
                          highlightColor:
                              const Color.fromARGB(125, 189, 189, 189),
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
                    ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: grey1100,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Image.asset(
                  checkbox,
                  width: 24,
                  height: 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
