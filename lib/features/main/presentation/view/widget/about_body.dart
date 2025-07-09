import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/core/services/get_it_service.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';
import 'package:movie_app/features/main/presentation/manager/cast_cubit/cast_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/cast_list.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_about_desc.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CastCubit(getIt.get<MainRepo>()),
      child: AboutBodyOverAll(),
    );
  }
}

class AboutBodyOverAll extends StatelessWidget {
  const AboutBodyOverAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.kHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Story Line', style: Styles.textBold14),
              SizedBox(height: 8),
              CustomAboutDesc(),
              SizedBox(height: 20),
              Text('Cast', style: Styles.textBold14),
              SizedBox(height: 12),
            ],
          ),
        ),
        CastList(),
      ],
    );
  }
}
