import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/custom_snack_bar.dart';
import 'package:movie_app/features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_loading.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/login_view_body.dart';
import 'package:movie_app/features/profile/presentation/view/profile_view.dart';

class LoginViewBodyBloc extends StatelessWidget {
  const LoginViewBodyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, ProfileView.routeName);
        } else if (state is LoginFailure) {
          customSnackBar(context, state.message, isError: true);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            const LoginViewBody(),
            if (state is LoginLoading)
              const Positioned.fill(child: CustomLoading()),
          ],
        );
      },
    );
  }
}
