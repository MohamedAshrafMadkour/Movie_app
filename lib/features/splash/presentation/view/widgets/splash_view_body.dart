import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/constants/keys.dart';
import 'package:movie_app/core/services/auth_service.dart';
import 'package:movie_app/core/services/pref_storage.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/Auth/presentation/view/login_view.dart';
import 'package:movie_app/features/on_boarding/presentation/view/onboarding_view.dart';
import 'package:movie_app/features/profile/presentation/view/profile_view.dart';
import 'package:movie_app/features/ready/presentation/view/ready_view.dart';
import 'package:movie_app/generated/l10n.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executionNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .4),
        Center(child: SvgPicture.asset(Assets.imagesMovieIcon)),
        SizedBox(height: 8),
        Text(S.of(context).main, style: Styles.textBold30),
        SizedBox(height: MediaQuery.of(context).size.height * .3),
        Text(
          textAlign: TextAlign.end,
          'V1.00',
          style: Styles.textSemiBold14.copyWith(color: Colors.white),
        ),
      ],
    );
  }

  void executionNavigation() {
    bool isOnboarding = PrefStorage.getBool(AllKeys.setOnboarding);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnboarding) {
        if (AuthService.isLogin()) {
          if (PrefStorage.getBool(AllKeys.setProfile)) {
            Navigator.pushNamed(context, ReadyView.routeName);
          } else {
            Navigator.pushNamed(context, ProfileView.routeName);
          }
        } else {
          Navigator.pushNamed(context, LoginView.routeName);
        }
      } else {
        Navigator.pushNamed(context, OnboardingView.routeName);
      }
    });
  }
}
