import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/presentation/manager/channels_cubit/channels_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/channel_item.dart';
import 'package:provider/provider.dart';

class ChannelsList extends StatefulWidget {
  const ChannelsList({super.key, required this.countryCode});
  final String countryCode;
  @override
  State<ChannelsList> createState() => _ChannelsListState();
}

class _ChannelsListState extends State<ChannelsList> {
  @override
  void initState() {
    super.initState();
    _fetchChannels();
  }

  @override
  void didUpdateWidget(covariant ChannelsList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.countryCode != widget.countryCode) {
      _fetchChannels();
    }
  }

  void _fetchChannels() {
    final movieId = Provider.of<AllFilmsModel>(context, listen: false).id!;
    final cubit = context.read<ChannelsCubit>();

    cubit.fetchChannels(id: movieId, countryCode: widget.countryCode);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelsCubit, ChannelsState>(
      builder: (context, state) {
        if (state is ChannelsSuccess) {
          final country =
              state.channels.results?[widget.countryCode.toUpperCase()];
          final channels = country?.flatrate;
          final link = country?.link ?? '';
          if (channels == null || channels.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(child: Text('No Channels Found')),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ChannelsItem(provider: channels[index], watchLink: link),
              ),
              childCount: channels.length,
            ),
          );
        } else if (state is ChannelsFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: ChannelsItemShimmer(),
              ),
              childCount: 10,
            ),
          );
        }
      },
    );
  }
}
