import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
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
