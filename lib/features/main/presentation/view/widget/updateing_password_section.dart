import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/core/helper/custom_snack_bar.dart';
import 'package:movie_app/core/services/get_it_service.dart';
import 'package:movie_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:movie_app/features/Auth/presentation/manager/updating_password/updating_password_cubit.dart';
import 'package:movie_app/features/Auth/presentation/view/widget/custom_loading.dart';
import 'package:movie_app/features/main/presentation/view/widget/updating_password_section_body.dart';

class UpdatingPasswordSection extends StatelessWidget {
  const UpdatingPasswordSection({super.key});
  static const routeName = 'updating_password_section';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatingPasswordCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, 'Updating Password'),
        body: UpdatingPasswordSectionBodyBloc(),
      ),
    );
  }
}

class UpdatingPasswordSectionBodyBloc extends StatelessWidget {
  const UpdatingPasswordSectionBodyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdatingPasswordCubit, UpdatingPasswordState>(
      listener: (context, state) {
        if (state is UpdatingPasswordSuccess) {
          customSnackBar(context, 'Password Updated Successfully');
        } else if (state is UpdatingPasswordFailure) {
          customSnackBar(context, state.message);
        } else if (state is UpdatingPasswordLoading) {
          CustomLoading();
        }
      },
      child: UpdatingPasswordSectionBody(),
    );
  }
}
