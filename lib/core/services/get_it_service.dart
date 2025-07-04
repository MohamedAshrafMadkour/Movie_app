import 'package:get_it/get_it.dart';
import 'package:movie_app/core/services/auth_service.dart';
import 'package:movie_app/core/services/database.dart';
import 'package:movie_app/core/services/firestore_database.dart';
import 'package:movie_app/core/services/storage_service.dart';
import 'package:movie_app/core/services/supabase_storage_service.dart';
import 'package:movie_app/features/Auth/data/repo/auth_repo_impl.dart';
import 'package:movie_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:movie_app/features/profile/data/repo/image_repo_impl.dart';
import 'package:movie_app/features/profile/data/repo/profile_repo_impl.dart';
import 'package:movie_app/features/profile/domain/repo/image_repo.dart';
import 'package:movie_app/features/profile/domain/repo/profile_repo.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreDatabase());
  getIt.registerSingleton<StorageService>(SupabaseStorageService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authService: getIt<AuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ImageRepo>(
    ImageRepoImpl(storageService: getIt<StorageService>()),
  );
  getIt.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(databaseService: getIt<DatabaseService>()),
  );
}
