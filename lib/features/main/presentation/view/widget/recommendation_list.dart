import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/main/presentation/manager/all_movies_cubit/fetch_all_movies_cubit.dart';
import 'package:movie_app/features/main/presentation/view/widget/recommendation_item.dart';

class RecommendationList extends StatefulWidget {
  const RecommendationList({super.key});

  @override
  State<RecommendationList> createState() => _RecommendationListState();
}

class _RecommendationListState extends State<RecommendationList> {
  @override
  void initState() {
    context.read<FetchAllMoviesCubit>().fetchTopRelatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllMoviesCubit, FetchAllMoviesState>(
      builder: (context, state) {
        if (state is FetchAllMoviesSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .28,
            child: ListView.builder(
              itemCount: state.movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  RecommendationItem(movies: state.movies[index]),
            ),
          );
        } else if (state is FetchAllMoviesFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
