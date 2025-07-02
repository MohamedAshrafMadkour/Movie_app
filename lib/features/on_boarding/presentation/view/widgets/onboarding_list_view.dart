import 'package:flutter/material.dart';
import 'package:movie_app/features/on_boarding/data/model/page_view_item_model.dart';
import 'package:movie_app/features/on_boarding/presentation/view/widgets/page_view_item.dart';

class OnboardingPageViewList extends StatelessWidget {
  const OnboardingPageViewList({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,

      itemCount: pageViewItemModel(context).length,
      itemBuilder: (context, index) => PageViewItem(
        pageViewItemModel: pageViewItemModel(context)[index],
        pageController: pageController,
      ),
    );
  }
}
