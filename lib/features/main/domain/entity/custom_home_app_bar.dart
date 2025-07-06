import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage),
      title: const Text('Hi, Mohit', style: Styles.textBold14),
      subtitle: Text('Let\'s watch a movie', style: Styles.textRegular12),
      trailing: SvgPicture.asset(Assets.imagesUnActiveUnactiveSearch),
    );
  }
}
