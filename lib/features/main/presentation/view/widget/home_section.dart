import 'package:flutter/material.dart';
import 'package:movie_app/features/main/domain/entity/custom_home_app_bar.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: Column(children: [CustomHomeAppBar()])),
      ],
    );
  }
}
