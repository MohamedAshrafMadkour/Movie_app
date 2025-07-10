import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/main/data/Model/cast_model.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_cached_image.dart';
import 'package:shimmer/shimmer.dart';

class CastItem extends StatelessWidget {
  const CastItem({super.key, required this.castModel});
  final CastModel castModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6, left: 6, right: 12, bottom: 6),
      decoration: ShapeDecoration(
        color: const Color(0xFFF1F0FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(
            child: CustomCachedNetworkImageProfile(
              borderRadius: BorderRadius.circular(100),
              image: 'https://image.tmdb.org/t/p/w500/${castModel.profilePath}',
            ),
          ),
          SizedBox(width: 8),
          Text(
            castModel.name ?? "anonymous actor ",
            style: Styles.textSemiBold12.copyWith(
              color: AppColors.kSecondColor,
            ),
          ),
        ],
      ),
    );
  }
}

class CastItemShimmer extends StatelessWidget {
  const CastItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.only(top: 6, left: 6, right: 12, bottom: 6),
        decoration: ShapeDecoration(
          color: const Color(0xFFF1F0FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            Container(height: 12, width: 80, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
