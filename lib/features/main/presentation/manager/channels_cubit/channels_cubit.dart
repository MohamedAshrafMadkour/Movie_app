import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/main/data/Model/channels_model/channels_model.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';

part 'channels_state.dart';

class ChannelsCubit extends Cubit<ChannelsState> {
  ChannelsCubit(this.mainRepo) : super(ChannelsInitial());
  final MainRepo mainRepo;

  Future<void> fetchChannels({required int id}) async {
    emit(ChannelsLoading());
    final result = await mainRepo.fetchAllChannel(id: id);
    result.fold(
      (failure) => emit(ChannelsFailure(message: failure.errorMessage)),
      (success) => emit(ChannelsSuccess(channels: success)),
    );
  }
}
