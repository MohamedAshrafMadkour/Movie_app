import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/Auth/domain/entity/user_entity.dart';
import 'package:movie_app/features/Auth/domain/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await authRepo.loginEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginFailure(message: failure.errorMessage)),
      (success) => emit(LoginSuccess(userEntity: success)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.errorMessage)),
      (success) => emit(LoginSuccess(userEntity: success)),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.errorMessage)),
      (success) => emit(LoginSuccess(userEntity: success)),
    );
  }
}
