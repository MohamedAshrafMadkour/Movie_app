import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/Auth/domain/repo/auth_repo.dart';

part 'updating_password_state.dart';

class UpdatingPasswordCubit extends Cubit<UpdatingPasswordState> {
  UpdatingPasswordCubit(this.authRepo) : super(UpdatingPasswordInitial());
  final AuthRepo authRepo;

  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (newPassword.length < 8) {
      emit(const UpdatingPasswordFailure(message: 'Password too short'));
      return;
    }

    if (newPassword != confirmPassword) {
      emit(const UpdatingPasswordFailure(message: 'Passwords do not match'));
      return;
    }

    emit(UpdatingPasswordLoading());

    final result = await authRepo.updatePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    result.fold(
      (failure) => emit(UpdatingPasswordFailure(message: failure.errorMessage)),
      (_) => emit(UpdatingPasswordSuccess()),
    );
  }
}
