part of 'updating_password_cubit.dart';

sealed class UpdatingPasswordState extends Equatable {
  const UpdatingPasswordState();

  @override
  List<Object> get props => [];
}

final class UpdatingPasswordInitial extends UpdatingPasswordState {}

final class UpdatingPasswordLoading extends UpdatingPasswordState {}

final class UpdatingPasswordFailure extends UpdatingPasswordState {
  final String message;
  const UpdatingPasswordFailure({required this.message});
}

final class UpdatingPasswordSuccess extends UpdatingPasswordState {}
