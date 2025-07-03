import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/core/helper/custom_snack_bar.dart';
import 'package:movie_app/core/services/get_it_service.dart';
import 'package:movie_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:movie_app/features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:movie_app/features/Auth/presentation/view/login_view.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_loading.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = 'register_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, 'Sign Up'),
        body: RegisterViewBodyBloc(),
      ),
    );
  }
}

class RegisterViewBodyBloc extends StatelessWidget {
  const RegisterViewBodyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushNamed(context, LoginView.routeName);
        } else if (state is RegisterFailure) {
          customSnackBar(context, state.message);
          CustomLoading();
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            const RegisterViewBody(),
            if (state is RegisterLoading)
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * .38,
                left: MediaQuery.sizeOf(context).width * .35,
                child: const CustomLoading(),
              ),
          ],
        );
      },
    );
  }
}
