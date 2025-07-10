import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/get_dummy.dart';
import 'package:movie_app/features/main/presentation/manager/all_movies_cubit/fetch_all_movies_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/popular_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularItemList extends StatefulWidget {
  const PopularItemList({super.key});

  @override
  State<PopularItemList> createState() => _PopularItemListState();
}

class _PopularItemListState extends State<PopularItemList> {
  @override
  void initState() {
    context.read<FetchAllMoviesCubit>().fetchPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllMoviesCubit, FetchAllMoviesState>(
      builder: (context, state) {
        if (state is FetchAllMoviesSuccess) {
          final reversedMovies = state.movies.reversed.toList();
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: PopularItem(movie: reversedMovies[index]),
              ),
              childCount: state.movies.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: 3.8 / 4.5,
            ),
          );
        } else if (state is FetchAllMoviesFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        } else {
          return Skeletonizer.sliver(
            enabled: state is FetchAllMoviesLoading,
            child: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: PopularItem(movie: getDummyFilmsList()[index]),
                ),
                childCount: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 3.8 / 4.5,
              ),
            ),
          );
        }
      },
    );
  }
}
