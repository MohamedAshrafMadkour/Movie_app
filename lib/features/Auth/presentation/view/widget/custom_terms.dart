import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomTerms extends StatelessWidget {
  const CustomTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text:
                'By click the agree and continue button, you’re agree to Movees’',
            style: Styles.textRegular12.copyWith(
              color: const Color(0xFF4C4E55),
            ),
          ),
          TextSpan(
            text: ' ',
            style: Styles.textRegular10.copyWith(
              color: const Color(0xFF4C4E55),
            ),
          ),
          TextSpan(
            text: 'Terms and Service',
            style: Styles.textBold12.copyWith(color: AppColors.kSecondColor),
          ),
          TextSpan(
            text: ' ',
            style: Styles.textRegular10.copyWith(
              color: const Color(0xFF4C4E55),
            ),
          ),
          TextSpan(
            text: 'and acknlowledge the',
            style: Styles.textRegular12.copyWith(
              color: const Color(0xFF4C4E55),
            ),
          ),
          TextSpan(
            text: ' ',
            style: Styles.textRegular10.copyWith(
              color: const Color(0xFF4C4E55),
            ),
          ),
          TextSpan(
            text: 'Privacy and Policy',
            style: Styles.textBold12.copyWith(color: AppColors.kSecondColor),
          ),
        ],
      ),
    );
  }
}
