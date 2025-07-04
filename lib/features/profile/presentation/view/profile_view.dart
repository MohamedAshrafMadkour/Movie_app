import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/core/services/get_it_service.dart';
import 'package:movie_app/features/profile/domain/repo/image_repo.dart';
import 'package:movie_app/features/profile/domain/repo/profile_repo.dart';
import 'package:movie_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:movie_app/features/profile/presentation/view/widget/profile_view_body_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'profile_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(getIt.get<ImageRepo>(), getIt.get<ProfileRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, 'Create Profile'),
        body: SafeArea(child: ProfileViewBodyBloc()),
      ),
    );
  }
}
