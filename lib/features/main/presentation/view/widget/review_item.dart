import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/main/data/Model/review_model/review_model.dart';
import 'package:movie_app/features/main/presentation/view/widget/all_content_review.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_cached_image.dart';
import 'package:shimmer/shimmer.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.reviewModel});
  final ReviewModel reviewModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CustomCachedNetworkImageProfile(
              image:
                  "https://image.tmdb.org/t/p/w500/${reviewModel.authorDetails?.avatarPath}",
            ),
          ),
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(reviewModel.author ?? " ", style: Styles.textSemiBold14),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: SvgPicture.asset(Assets.imagesStar),
              ),
              const SizedBox(width: 4),
              Text(
                reviewModel.authorDetails?.rating.toString() ?? " ",
                style: Styles.textBold12.copyWith(
                  color: const Color(0xFF191D31),
                ),
              ),
            ],
          ),
        ],
      ),
      subtitle: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            reviewModel.content ?? " ",
            style: Styles.textRegular12.copyWith(
              color: const Color(0xFFA7AEC1),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AllContentReview.routeName,
                  arguments: reviewModel.content,
                );
              },
              child: Text(
                'More',
                style: Styles.textRegular12.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewItemShimmer extends StatelessWidget {
  const ReviewItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          shimmerBox(width: 100, height: 14),
          shimmerBox(width: 40, height: 14),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          shimmerBox(width: double.infinity, height: 12),
          const SizedBox(height: 4),
          shimmerBox(width: double.infinity, height: 12),
          const SizedBox(height: 4),
          shimmerBox(width: 80, height: 12),
          const SizedBox(height: 6),
          shimmerBox(width: 40, height: 12),
        ],
      ),
    );
  }

  Widget shimmerBox({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(width: width, height: height, color: Colors.white),
    );
  }
}
