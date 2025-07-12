import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class PopularHeader extends StatelessWidget {
  const PopularHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Popular Movies', style: Styles.textBold14),
        Text('See All', style: Styles.textMedium12),
      ],
    );
  }
}
