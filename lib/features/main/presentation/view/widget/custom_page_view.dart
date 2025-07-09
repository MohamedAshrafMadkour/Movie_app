import 'package:flutter/material.dart';
import 'package:movie_app/features/main/presentation/view/widget/about_body.dart';
import 'package:movie_app/features/main/presentation/view/widget/channels_body.dart';
import 'package:movie_app/features/main/presentation/view/widget/review_body.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: getPages(pageController).length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return getPages(pageController)[index];
      },
    );
  }
}

List<Widget> getPages(PageController pageController) {
  return [AboutBody(), ReviewBody(), ChannelsBody()];
}
