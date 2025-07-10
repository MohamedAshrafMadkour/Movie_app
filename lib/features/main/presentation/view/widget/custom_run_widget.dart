import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomRunWidget extends StatelessWidget {
  const CustomRunWidget({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        decoration: ShapeDecoration(
          color: const Color(0xFF685CF0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.imagesVideoCircle, height: 20, width: 20),
            SizedBox(width: 8),
            Text(
              'Play',
              style: Styles.textSemiBold14.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
