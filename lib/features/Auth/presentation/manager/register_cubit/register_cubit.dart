import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Auth/domain/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  Future<void> register({
    required String email,
    required String password,
    required String birthday,
    required String confirmPassword,
  }) async {
    final bool hasLetters = password.contains(RegExp(r'[A-Za-z]'));
    final bool hasNumbers = password.contains(RegExp(r'\d'));
    if (password.length < 8) {
      emit(RegisterFailure(message: 'password must be at least 8 characters'));
      return;
    }

    if (!hasLetters || !hasNumbers) {
      emit(
        RegisterFailure(message: 'password must contain letters and numbers'),
      );
      return;
    }
    if (password != confirmPassword) {
      emit(RegisterFailure(message: 'passwords do not match'));
      return;
    }

    emit(RegisterLoading());
    final result = await authRepo.createEmailAndPassword(
      email: email,
      password: password,
      birthday: birthday,
    );
    result.fold(
      (failure) => emit(RegisterFailure(message: failure.errorMessage)),
      (success) => emit(RegisterSuccess()),
    );
  }
}
