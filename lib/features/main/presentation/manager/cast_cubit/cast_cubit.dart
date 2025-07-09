import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/main/data/Model/cast_model.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit(this.mainRepo) : super(CastInitial());
  final MainRepo mainRepo;

  Future<void> fetchCast({required int id}) async {
    emit(CastLoading());
    final result = await mainRepo.fetchAllCast(id: id);
    result.fold(
      (failure) => emit(CastFailure(message: failure.errorMessage)),
      (success) => emit(CastSuccess(casts: success)),
    );
  }
}
