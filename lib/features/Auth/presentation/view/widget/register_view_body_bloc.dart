import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/custom_snack_bar.dart';
import 'package:movie_app/features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:movie_app/features/Auth/presentation/view/login_view.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_loading.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/register_view_body.dart';

class RegisterViewBodyBloc extends StatelessWidget {
  const RegisterViewBodyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushNamed(context, LoginView.routeName);
        } else if (state is RegisterFailure) {
          customSnackBar(context, state.message, isError: true);
          CustomLoading();
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            const RegisterViewBody(),
            if (state is RegisterLoading)
              Positioned.fill(child: const CustomLoading()),
          ],
        );
      },
    );
  }
}
