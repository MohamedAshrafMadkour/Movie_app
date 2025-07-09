import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/styles.dart';

class ActiveTab extends StatelessWidget {
  const ActiveTab({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.textBold14.copyWith(color: AppColors.kPrimaryColor),
    );
  }
}
