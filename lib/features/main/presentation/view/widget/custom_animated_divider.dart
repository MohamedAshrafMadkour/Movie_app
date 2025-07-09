import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/features/main/presentation/view/widget/tab_list_header.dart';

class CustomAnimatedDivider extends StatelessWidget {
  const CustomAnimatedDivider({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 1, color: Colors.grey, width: double.infinity),
        AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment: currentIndex == 0
              ? Alignment.centerLeft
              : currentIndex == 1
              ? Alignment.center
              : Alignment.centerRight,
          child: Container(
            height: 2,
            width: MediaQuery.of(context).size.width / tabList.length,
            color: AppColors.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
