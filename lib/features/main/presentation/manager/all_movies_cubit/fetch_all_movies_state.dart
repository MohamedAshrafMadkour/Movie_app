part of 'fetch_all_movies_cubit.dart';

sealed class FetchAllMoviesState extends Equatable {
  const FetchAllMoviesState();

  @override
  List<Object> get props => [];
}

final class FetchAllMoviesInitial extends FetchAllMoviesState {}

final class FetchAllMoviesLoading extends FetchAllMoviesState {}

final class FetchAllMoviesSuccess extends FetchAllMoviesState {
  final List<AllFilmsModel> movies;
  const FetchAllMoviesSuccess({required this.movies});
}

final class FetchAllMoviesFailure extends FetchAllMoviesState {
  final String message;
  const FetchAllMoviesFailure({required this.message});
}
