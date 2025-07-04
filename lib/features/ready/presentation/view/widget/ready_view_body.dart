import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/main/presentation/view/main_view.dart';
import 'package:movie_app/features/on_boarding/presentation/view/widgets/custom_button.dart';
import 'package:movie_app/features/ready/presentation/view/widget/custom_white_ground.dart';

class ReadyViewBody extends StatelessWidget {
  const ReadyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          Positioned.fill(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.sizeOf(context).height * .3,
            child: Image.asset(Assets.imagesShowman1, fit: BoxFit.fill),
          ),
          ...List.generate(7, (index) => const CustomWhiteGround()),
          Positioned(
            top: MediaQuery.sizeOf(context).height * .63,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.kHorizontal,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    'Are you ready to watch movies?',
                    textAlign: TextAlign.center,
                    style: Styles.textBold24,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod ',
                    textAlign: TextAlign.center,
                    style: Styles.textRegular14,
                  ),
                  SizedBox(height: 48),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: CustomButton(
                      title: 'Continue',
                      onPressed: () {
                        Navigator.pushNamed(context, MainView.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
