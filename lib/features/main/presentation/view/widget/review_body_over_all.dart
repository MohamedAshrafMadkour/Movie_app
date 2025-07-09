import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/features/main/presentation/view/widget/review_header.dart';
import 'package:movie_app/features/main/presentation/view/widget/review_item_list.dart';

class ReviewBodyOverAll extends StatelessWidget {
  const ReviewBodyOverAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.kHorizontal),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [ReviewHeader(), SizedBox(height: 8)],
            ),
          ),

          const ReviewItemList(),
        ],
      ),
    );
  }
}
