import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/get_it_service.dart';

import 'package:movie_app/features/main/domain/repo/main_repo.dart';
import 'package:movie_app/features/main/presentation/manager/all_movies_cubit/fetch_all_movies_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/home_section_body.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchAllMoviesCubit(getIt.get<MainRepo>()),
      child: const HomeSectionBody(),
    );
  }
}
