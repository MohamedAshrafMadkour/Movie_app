part of 'cast_cubit.dart';

sealed class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

final class CastInitial extends CastState {}

final class CastLoading extends CastState {}

final class CastSuccess extends CastState {
  final List<CastModel> casts;
  const CastSuccess({required this.casts});
}

final class CastFailure extends CastState {
  final String message;
  const CastFailure({required this.message});
}
