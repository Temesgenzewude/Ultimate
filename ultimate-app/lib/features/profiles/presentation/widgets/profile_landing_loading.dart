import 'package:flutter/cupertino.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';
import 'package:flutter_ultimate/features/profiles/presentation/widgets/profile_widget_shimmer.dart';

class ProfileLandingLoading extends StatelessWidget {
  const ProfileLandingLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 4),
      itemBuilder: (context, index) => const AnimationClick(
        child: ProfileShimmer(),
      ),
    );
  }
}
