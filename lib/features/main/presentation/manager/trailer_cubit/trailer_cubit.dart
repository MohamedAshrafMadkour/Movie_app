import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/main/data/Model/trailer_model/trailer_model.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit(this.mainRepo) : super(TrailerInitial());
  final MainRepo mainRepo;

  Future<void> fetchTrailer({required int id}) async {
    emit(TrailerLoading());
    final result = await mainRepo.fetchTrailer(id: id);
    result.fold(
      (failure) => emit(TrailerFailure(message: failure.errorMessage)),
      (success) => emit(TrailerSuccess(trailers: success)),
    );
  }
}
