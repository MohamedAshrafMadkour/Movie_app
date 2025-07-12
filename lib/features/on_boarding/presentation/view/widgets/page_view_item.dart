import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/keys.dart';
import 'package:movie_app/core/services/pref_storage.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/Auth/presentation/view/login_view.dart';
import 'package:movie_app/features/on_boarding/data/model/page_view_item_model.dart';
import 'package:movie_app/features/on_boarding/presentation/view/widgets/custom_button.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.pageViewItemModel,
    required this.pageController,
  });

  final PageViewItemModel pageViewItemModel;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: Image.asset(pageViewItemModel.image, fit: BoxFit.fill)),
        const SizedBox(height: 48),
        Text(
          pageViewItemModel.title,
          textAlign: TextAlign.center,
          style: Styles.textBold20,
        ),
        const SizedBox(height: 24),
        Text(
          pageViewItemModel.description,
          textAlign: TextAlign.center,
          style: Styles.textRegular14,
        ),
        const SizedBox(height: 56),
        CustomButton(
          title: pageViewItemModel.buttonTitle,
          onPressed: () {
            executionNavigation(context);
          },
        ),
      ],
    );
  }

  void executionNavigation(BuildContext context) {
    if (pageController.page == 0) {
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else if (pageController.page == 1) {
      pageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else if (pageController.page == 2) {
      PrefStorage.setBool(AllKeys.setOnboarding, true);
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    }
  }
}
