import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class RecommendationHeader extends StatelessWidget {
  const RecommendationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Recommended for you', style: Styles.textBold14),
        Text('See All', style: Styles.textMedium12),
      ],
    );
  }
}
