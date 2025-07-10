import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/presentation/manager/trailer_cubit/trailer_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_cached_image.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_run_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomPostwarData extends StatefulWidget {
  const CustomPostwarData({super.key});

  @override
  State<CustomPostwarData> createState() => _CustomPostwarDataState();
}

class _CustomPostwarDataState extends State<CustomPostwarData> {
  bool showTrailer = false;
  YoutubePlayerController? controller;

  void playTrailer(String key) {
    controller = YoutubePlayerController(
      initialVideoId: key,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        disableDragSeek: true,
        forceHD: false,
      ),
    );
    setState(() => showTrailer = true);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrailerCubit, TrailerState>(
      builder: (context, state) {
        if (showTrailer && controller != null) {
          return YoutubePlayer(
            controller: controller!,
            showVideoProgressIndicator: true,
          );
        }
        String? videoKey;

        if (state is TrailerSuccess && state.trailer.results != null) {
          final trailer = state.trailer.results!.firstWhere(
            (e) => e.site?.toLowerCase() == 'youtube' && e.key != null,
            orElse: () => state.trailer.results!.first,
          );
          videoKey = trailer.key;
        }
        return Stack(
          children: [
            SizedBox.expand(
              child: CustomCachedNetworkImage(
                borderRadius: videoKey != null
                    ? BorderRadius.zero
                    : BorderRadius.circular(8),
                image: videoKey != null
                    ? "https://img.youtube.com/vi/$videoKey/0.jpg"
                    : "https://image.tmdb.org/t/p/w500/${context.read<AllFilmsModel>().posterPath}",
              ),
            ),
            if (videoKey != null)
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                top: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomRunWidget(onTap: () => playTrailer(videoKey!)),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
