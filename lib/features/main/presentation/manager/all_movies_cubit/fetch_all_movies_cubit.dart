import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';

part 'fetch_all_movies_state.dart';

class FetchAllMoviesCubit extends Cubit<FetchAllMoviesState> {
  FetchAllMoviesCubit(this.mainRepo) : super(FetchAllMoviesInitial());
  final MainRepo mainRepo;

  Future<void> fetchPopularMovies() async {
    emit(FetchAllMoviesLoading());
    final result = await mainRepo.fetchPopularFilms();
    result.fold(
      (failure) => emit(FetchAllMoviesFailure(message: failure.errorMessage)),
      (success) => emit(FetchAllMoviesSuccess(movies: success)),
    );
  }

  Future<void> fetchTopRelatedMovies() async {
    emit(FetchAllMoviesLoading());
    final result = await mainRepo.fetchTopRelatedFilms();
    result.fold(
      (failure) => emit(FetchAllMoviesFailure(message: failure.errorMessage)),
      (success) => emit(FetchAllMoviesSuccess(movies: success)),
    );
  }
}
