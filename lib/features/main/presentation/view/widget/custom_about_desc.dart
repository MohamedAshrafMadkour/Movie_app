import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';

class CustomAboutDesc extends StatelessWidget {
  const CustomAboutDesc({super.key});

  @override
  Widget build(BuildContext context) {
    var size = context.read<AllFilmsModel>().overview?.length;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .1,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: context.read<AllFilmsModel>().overview,
              style: Styles.textRegular12.copyWith(),
            ),
            TextSpan(
              text: size! <= 0 ? 'no description for this movie' : 'More',
              style: Styles.textBold12.copyWith(color: AppColors.kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
