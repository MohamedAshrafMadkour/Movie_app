import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/keys.dart';
import 'package:movie_app/core/helper/custom_snack_bar.dart';
import 'package:movie_app/core/services/pref_storage.dart';
import 'package:movie_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:movie_app/features/profile/presentation/view/widget/profile_view_body.dart';
import 'package:movie_app/features/ready/presentation/view/ready_view.dart';

class ProfileViewBodyBloc extends StatelessWidget {
  const ProfileViewBodyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccess) {
          PrefStorage.setBool(AllKeys.setProfile, true);
          Navigator.pushNamed(context, ReadyView.routeName);
        } else if (state is ProfileFailure) {
          customSnackBar(context, state.message);
        } else if (state is ProfileLoading) {
          const Center(child: CircularProgressIndicator());
        }
      },
      child: const ProfileViewBody(),
    );
  }
}
