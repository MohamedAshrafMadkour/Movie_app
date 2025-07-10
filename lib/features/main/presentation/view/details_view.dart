import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/custom_app_bar.dart';
import 'package:movie_app/core/services/get_it_service.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';
import 'package:movie_app/features/main/presentation/manager/trailer_cubit/trailer_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/details_view_body.dart';
import 'package:provider/provider.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.model});
  static const routeName = 'details_view';
  final AllFilmsModel model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit(getIt.get<MainRepo>()),
      child: Scaffold(
        appBar: customAppBar(context, 'Details'),
        body: Provider<AllFilmsModel>.value(
          value: model,
          child: DetailsViewBodyBloc(),
        ),
      ),
    );
  }
}

class DetailsViewBodyBloc extends StatelessWidget {
  const DetailsViewBodyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return DetailsViewBody();
  }
}
