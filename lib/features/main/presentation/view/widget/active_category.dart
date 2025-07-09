import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class ActiveCategory extends StatelessWidget {
  const ActiveCategory({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: ShapeDecoration(
        color: const Color(0xFF685CF0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: FittedBox(
        child: Text(
          category,
          style: Styles.textMedium12.copyWith(color: const Color(0xFFFEFEFE)),
        ),
      ),
    );
  }
}
