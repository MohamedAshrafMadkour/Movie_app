import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class ReviewHeader extends StatelessWidget {
  const ReviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Reviews',
          style: Styles.textBold14.copyWith(color: const Color(0xFF191D31)),
        ),
        Text(
          'See All',
          textAlign: TextAlign.right,
          style: Styles.textMedium12.copyWith(color: Color(0xFFE55607)),
        ),
      ],
    );
  }
}
