import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/size.dart';
import 'package:movie_app/core/services/get_it_service.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';
import 'package:movie_app/features/main/presentation/manager/channels_cubit/channels_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/channels_header.dart';
import 'package:movie_app/features/main/presentation/view/widget/channels_list.dart';

class ChannelsBody extends StatelessWidget {
  const ChannelsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChannelsCubit(getIt.get<MainRepo>()),
      child: ChannelsBodyOverAll(),
    );
  }
}

class ChannelsBodyOverAll extends StatelessWidget {
  const ChannelsBodyOverAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.kHorizontal),
      child: CustomScrollView(
        slivers: const [
          SliverToBoxAdapter(child: ChannelsHeader()),
          ChannelsList(),
        ],
      ),
    );
  }
}
