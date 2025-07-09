import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class UnActiveCategory extends StatelessWidget {
  const UnActiveCategory({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Text(
      category,
      style: Styles.textMedium12.copyWith(color: const Color(0xFF111111)),
    );
  }
}
