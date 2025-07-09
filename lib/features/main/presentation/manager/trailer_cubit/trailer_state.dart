part of 'trailer_cubit.dart';

sealed class TrailerState extends Equatable {
  const TrailerState();

  @override
  List<Object> get props => [];
}

final class TrailerInitial extends TrailerState {}

final class TrailerLoading extends TrailerState {}

final class TrailerSuccess extends TrailerState {
  final List<TrailerModel> trailers;
  const TrailerSuccess({required this.trailers});
}

final class TrailerFailure extends TrailerState {
  final String message;
  const TrailerFailure({required this.message});
}
