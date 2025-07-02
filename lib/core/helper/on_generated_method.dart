import 'package:flutter/material.dart';
import 'package:movie_app/features/Auth/presentation/view/register_view.dart';
import 'package:movie_app/features/on_boarding/presentation/view/onboarding_view.dart';
import 'package:movie_app/features/splash/presentation/view/splash_view.dart';

MaterialPageRoute onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnboardingView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => RegisterView());
    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
