import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/core/services/get_it_service.dart';
import 'package:movie_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:movie_app/features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/login_view_body_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, 'Sign In'),
        body: const SafeArea(child: LoginViewBodyBloc()),
      ),
    );
  }
}
