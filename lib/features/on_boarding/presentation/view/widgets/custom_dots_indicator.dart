import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: currentPage.toDouble(),
      onTap: (position) {
        pageController.animateToPage(
          position.toInt(),
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      },
      decorator: DotsDecorator(
        color: const Color(0xFFE1E1E2),
        activeColor: AppColors.kPrimaryColor,
        size: const Size(6, 6),
        activeSize: const Size(24.0, 6.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
