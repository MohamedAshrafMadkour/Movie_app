import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Sign In'),
      body: LoginViewBody(),
    );
  }
}
