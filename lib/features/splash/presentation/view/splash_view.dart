import 'package:flutter/material.dart';
import 'package:movie_app/features/splash/presentation/view/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = 'splash_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF685CF0),
      body: const SplashViewBody(),
    );
  }
}
