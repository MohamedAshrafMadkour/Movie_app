import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/size.dart';

import 'package:movie_app/features/main/domain/entity/custom_home_app_bar.dart';
import 'package:movie_app/features/main/presentation/view/widget/popular_header.dart';
import 'package:movie_app/features/main/presentation/view/widget/popular_item.dart';
import 'package:movie_app/features/main/presentation/view/widget/popular_list.dart';
import 'package:movie_app/features/main/presentation/view/widget/recommendation_header.dart';
import 'package:movie_app/features/main/presentation/view/widget/recommendation_item.dart';
import 'package:movie_app/features/main/presentation/view/widget/recommendation_list.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: CustomHomeAppBar()),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RecommendationHeader(),
              ),
              SizedBox(height: 16),
              RecommendationList(),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PopularHeader(),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        PopularItemList(),
      ],
    );
  }
}
