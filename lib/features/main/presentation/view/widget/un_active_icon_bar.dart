import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UnActiveIconBar extends StatelessWidget {
  const UnActiveIconBar({super.key, required this.unActiveIcon});
  final String unActiveIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(unActiveIcon),
        Container(
          width: 24,
          height: 4,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ],
    );
  }
}
