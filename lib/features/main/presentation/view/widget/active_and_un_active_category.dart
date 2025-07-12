import 'package:flutter/material.dart';
import 'package:movie_app/features/main/presentation/view/widget/active_category.dart';
import 'package:movie_app/features/main/presentation/view/widget/un_active_category.dart';

class ActiveAndUnActiveCategory extends StatelessWidget {
  const ActiveAndUnActiveCategory({
    super.key,
    required this.isActive,

    required this.category,
  });
  final bool isActive;
  final String category;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: isActive
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: ActiveCategory(category: category),
      secondChild: UnActiveCategory(category: category),
      duration: const Duration(milliseconds: 300),
    );
  }
}
