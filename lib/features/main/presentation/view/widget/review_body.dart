import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/get_it_service.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';
import 'package:movie_app/features/main/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/review_body_over_all.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewsCubit(getIt.get<MainRepo>()),
      child: const ReviewBodyOverAll(),
    );
  }
}
