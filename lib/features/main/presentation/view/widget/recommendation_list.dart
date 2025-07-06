import 'package:flutter/material.dart';
import 'package:movie_app/features/main/presentation/view/widget/recommendation_item.dart';

class RecommendationList extends StatelessWidget {
  const RecommendationList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .26,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => RecommendationItem(),
      ),
    );
  }
}
