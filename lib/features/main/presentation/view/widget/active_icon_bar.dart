import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActiveIconBar extends StatelessWidget {
  const ActiveIconBar({super.key, required this.activeIcon});
  final String activeIcon;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(activeIcon);
  }
}
