import 'package:flutter/material.dart';
import 'package:movie_app/features/main/domain/entity/custom_home_app_bar.dart';
import 'package:movie_app/features/main/presentation/view/widget/popular_header.dart';
import 'package:movie_app/features/main/presentation/view/widget/popular_list.dart';
import 'package:movie_app/features/main/presentation/view/widget/recommendation_header.dart';
import 'package:movie_app/features/main/presentation/view/widget/recommendation_list.dart';

class HomeSectionBody extends StatelessWidget {
  const HomeSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CustomHomeAppBar()),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: RecommendationHeader(),
              ),
              SizedBox(height: 16),
              RecommendationList(),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
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
