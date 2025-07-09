import 'package:flutter/material.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_page_view.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_postwar_data.dart';
import 'package:movie_app/features/main/presentation/view/widget/tab_list_header.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key});

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  late PageController pageController;
  int pageControllerIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      pageControllerIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .4,
          width: double.infinity,
          child: CustomPostwarData(),
        ),
        SizedBox(height: 16),
        TapListHeader(pageController: pageController),
        SizedBox(height: 24),
        Expanded(child: CustomPageView(pageController: pageController)),
      ],
    );
  }
}
