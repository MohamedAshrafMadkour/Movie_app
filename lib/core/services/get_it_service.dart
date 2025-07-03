import 'package:get_it/get_it.dart';
import 'package:movie_app/core/services/auth_service.dart';
import 'package:movie_app/features/Auth/data/repo/auth_repo_impl.dart';
import 'package:movie_app/features/Auth/domain/repo/auth_repo.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<AuthService>(AuthService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(authService: getIt<AuthService>()),
  );
}
