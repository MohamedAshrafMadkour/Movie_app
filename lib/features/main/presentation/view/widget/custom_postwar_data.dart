import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_cached_image.dart';
import 'package:movie_app/features/main/presentation/view/widget/custom_run_widget.dart';

class CustomPostwarData extends StatelessWidget {
  const CustomPostwarData({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: CustomCachedNetworkImage(
            borderRadius: BorderRadius.zero,
            image:
                "https://image.tmdb.org/t/p/w500/${context.read<AllFilmsModel>().posterPath}",
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          top: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CustomRunWidget()],
          ),
        ),
      ],
    );
  }
}
