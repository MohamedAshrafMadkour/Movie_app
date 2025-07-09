import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/main/data/Model/channels_model/channels_model.dart';
import 'package:movie_app/features/main/data/Model/channels_model/flatrate.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_cached_image.dart';

class ChannelsItem extends StatelessWidget {
  const ChannelsItem({super.key, required this.provider});
  final Flatrate provider;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CustomCachedNetworkImage(
        image: 'https://image.tmdb.org/t/p/w200${provider.logoPath}',
      ),
      title: Text(provider.providerName ?? '', style: Styles.textSemiBold14),
      subtitle: Text(
        '${provider.displayPriority}  Priority',
        style: Styles.textRegular12,
      ),
    );
  }
}
