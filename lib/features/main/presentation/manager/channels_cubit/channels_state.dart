part of 'channels_cubit.dart';

sealed class ChannelsState extends Equatable {
  const ChannelsState();

  @override
  List<Object> get props => [];
}

final class ChannelsInitial extends ChannelsState {}

final class ChannelsLoading extends ChannelsState {}

final class ChannelsSuccess extends ChannelsState {
  final ChannelsModel channels;
  const ChannelsSuccess({required this.channels});
}

final class ChannelsFailure extends ChannelsState {
  final String message;
  const ChannelsFailure({required this.message});
}
