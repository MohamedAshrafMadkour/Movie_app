import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/features/on_boarding/presentation/view/widgets/custom_dots_indicator.dart';
import 'package:movie_app/features/on_boarding/presentation/view/widgets/onboarding_list_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(
      () => setState(() => currentPage = pageController.page!.round()),
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.kHorizontal),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: OnboardingPageViewList(pageController: pageController),
          ),
          const SizedBox(height: 30),
          CustomDotsIndicator(
            currentPage: currentPage,
            pageController: pageController,
          ),

          Visibility(
            visible: currentPage == 2,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 36),
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Color(0xFF7D7E83),
                  fontSize: 16,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w600,
                  height: 1.50,
                  letterSpacing: 0.08,
                ),
              ),
            ),
          ),
          currentPage == 2
              ? SizedBox(height: MediaQuery.sizeOf(context).height * .03)
              : SizedBox(height: MediaQuery.sizeOf(context).height * .1),
        ],
      ),
    );
  }
}
