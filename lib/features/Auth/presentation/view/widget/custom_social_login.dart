import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomSocialLogin extends StatelessWidget {
  const CustomSocialLogin({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });
  final String title, image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.kBorderRadius),
            side: const BorderSide(width: 1, color: Color(0xFF02050F)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            const SizedBox(width: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Styles.textSemiBold16.copyWith(
                color: const Color(0xFF0C0D0D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
