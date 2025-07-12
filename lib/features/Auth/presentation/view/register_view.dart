import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/core/services/get_it_service.dart';
import 'package:movie_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:movie_app/features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/register_view_body_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = 'register_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, 'Sign Up'),
        body: const RegisterViewBodyBloc(),
      ),
    );
  }
}
