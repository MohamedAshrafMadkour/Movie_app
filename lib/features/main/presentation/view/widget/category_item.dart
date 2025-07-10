import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movie_app/features/main/data/Model/category_model.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_cached_image.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.selectedCategory,
    required this.categoryModel,
  });
  final String selectedCategory;
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .3,
            height: MediaQuery.sizeOf(context).height * .1,
            child: CustomCachedNetworkImage(
              image:
                  "https://image.tmdb.org/t/p/w500/${categoryModel.posterPath}",
            ),
          ),
          SizedBox(width: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 155,
                child: Text(
                  categoryModel.originalTitle ?? " ",
                  style: Styles.textBold14,
                ),
              ),
              SizedBox(
                width: 155,
                child: Text(
                  categoryModel.title ?? " ",
                  style: Styles.textRegular10.copyWith(
                    color: const Color(0xFF4C4E55),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryItemShimmer extends StatelessWidget {
  const CategoryItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        children: [
          // صورة الفيلم
          Container(
            width: MediaQuery.sizeOf(context).width * .3,
            height: MediaQuery.sizeOf(context).height * .1,
            color: Colors.white,
          ),
          const SizedBox(width: 16),
          // النصوص
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 155, height: 14, color: Colors.white),
              const SizedBox(height: 8),
              Container(width: 155, height: 10, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
