import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';
import 'package:movie_app/features/main/data/Model/channels_model/flatrate.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_cached_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class ChannelsItem extends StatelessWidget {
  const ChannelsItem({
    super.key,
    required this.provider,
    required this.watchLink,
  });
  final Flatrate provider;
  final String watchLink;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Uri url = Uri.parse(watchLink);
        _launchUrl(url: url);
      },
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: CustomCachedNetworkImage(
          image: 'https://image.tmdb.org/t/p/w200${provider.logoPath}',
        ),
        title: Text(provider.providerName ?? '', style: Styles.textSemiBold14),
        subtitle: Text(
          '${provider.displayPriority}  Priority',
          style: Styles.textRegular12,
        ),
      ),
    );
  }
}

Future<void> _launchUrl({required Uri url}) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class ChannelsItemShimmer extends StatelessWidget {
  const ChannelsItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      title: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(width: 120, height: 14, color: Colors.white),
      ),
      subtitle: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: 80,
          height: 12,
          margin: const EdgeInsets.only(top: 8),
          color: Colors.white,
        ),
      ),
    );
  }
}
