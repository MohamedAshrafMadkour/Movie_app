import 'package:flutter/material.dart';
import 'package:movie_app/features/Auth/presentation/view/login_view.dart';
import 'package:movie_app/features/Auth/presentation/view/register_view.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/presentation/view/details_view.dart';
import 'package:movie_app/features/main/presentation/view/main_view.dart';
import 'package:movie_app/features/main/presentation/view/widget/all_content_review.dart';
import 'package:movie_app/features/main/presentation/view/widget/edit_profile_section.dart';
import 'package:movie_app/features/main/presentation/view/widget/help_section.dart';
import 'package:movie_app/features/main/presentation/view/widget/legal_section.dart';
import 'package:movie_app/features/main/presentation/view/widget/updateing_password_section.dart';
import 'package:movie_app/features/on_boarding/presentation/view/onboarding_view.dart';
import 'package:movie_app/features/profile/presentation/view/profile_view.dart';
import 'package:movie_app/features/ready/presentation/view/ready_view.dart';
import 'package:movie_app/features/splash/presentation/view/splash_view.dart';

MaterialPageRoute onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnboardingView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => RegisterView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => LoginView());
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => ProfileView());
    case UpdatingPasswordSection.routeName:
      return MaterialPageRoute(builder: (context) => UpdatingPasswordSection());
    case AllContentReview.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            AllContentReview(content: settings.arguments as String),
      );
    case LegalSection.routeName:
      return MaterialPageRoute(builder: (context) => LegalSection());
    case EditProfileSection.routeName:
      return MaterialPageRoute(builder: (context) => EditProfileSection());
    case DetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            DetailsView(model: settings.arguments as AllFilmsModel),
      );
    case HelpAndSupportSection.routeName:
      return MaterialPageRoute(builder: (context) => HelpAndSupportSection());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => MainView());
    case ReadyView.routeName:
      return MaterialPageRoute(builder: (context) => ReadyView());
    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
