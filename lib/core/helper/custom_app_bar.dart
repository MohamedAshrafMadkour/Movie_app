import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/core/utils/styles.dart';

AppBar customAppBar(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    leading: GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Center(
        child: SvgPicture.asset(Assets.imagesArrowLeft, height: 30, width: 30),
      ),
    ),
    backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0,

    centerTitle: true,
    title: Text(title, textAlign: TextAlign.center, style: Styles.textBold20),
  );
}
