import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/presentation/manager/channels_cubit/channels_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/channel_item.dart';

class ChannelsList extends StatefulWidget {
  const ChannelsList({super.key});

  @override
  State<ChannelsList> createState() => _ChannelsListState();
}

class _ChannelsListState extends State<ChannelsList> {
  @override
  void initState() {
    context.read<ChannelsCubit>().fetchChannels(
      id: context.read<AllFilmsModel>().id!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelsCubit, ChannelsState>(
      builder: (context, state) {
        if (state is ChannelsSuccess) {
          final flatrate = state.channels.results?.eg?.flatrate;
          if (flatrate == null) {
            return const SliverToBoxAdapter(
              child: Center(child: Text('No Channels')),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ChannelsItem(provider: flatrate[index]),
              ),
              childCount: flatrate.length,
            ),
          );
        } else if (state is ChannelsFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/data/Model/channels_model/results.dart';
import 'package:movie_app/features/main/presentation/manager/channels_cubit/channels_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/channel_item.dart';

class ChannelsList extends StatefulWidget {
  const ChannelsList({super.key});

  @override
  State<ChannelsList> createState() => _ChannelsListState();
}

class _ChannelsListState extends State<ChannelsList> {
  final List<String> selectedCountries = const ['EG', 'US', 'GB'];
  @override
  void initState() {
    context.read<ChannelsCubit>().fetchChannels(
      id: context.read<AllFilmsModel>().id!,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelsCubit, ChannelsState>(
      builder: (context, state) {
        if (state is ChannelsSuccess) {
          final results = state.channels.results;

          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final countryCode = selectedCountries[index];
              final countryData = getCountryData(results, countryCode);
              final flatrateList = countryData?.flatrate ?? [];

              if (flatrateList.isEmpty) return const SizedBox();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      countryCode,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...flatrateList.map(
                    (provider) => ChannelsItem(provider: provider),
                  ),
                ],
              );
            }, childCount: selectedCountries.length),
          );
        } else if (state is ChannelsFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  dynamic getCountryData(Results? results, String countryCode) {
    switch (countryCode) {
      case 'EG':
        return results?.eg;
      case 'US':
        return results?.us;
      case 'GB':
        return results?.gb;
      case 'IN':
        return results?.resultsIn;
      
      default:
        return null;
    }
  }
} */
