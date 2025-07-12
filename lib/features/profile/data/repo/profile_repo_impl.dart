import 'package:dartz/dartz.dart';
import 'package:movie_app/core/constants/endpoints.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/helper/get_user_data.dart';
import 'package:movie_app/core/services/database.dart';
import 'package:movie_app/features/Auth/domain/entity/user_entity.dart';
import 'package:movie_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:movie_app/features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final DatabaseService databaseService;
  final AuthRepo authRepo;
  ProfileRepoImpl(this.authRepo, {required this.databaseService});

  @override
  Future<Either<Failure, void>> updateUserdata({
    required String uid,
    required String name,
    required String imageUrl,
  }) async {
    try {
      await databaseService.updateData(
        path: Endpoints.updateUser,
        document: uid,
        data: {"name": name, "image": imageUrl},
      );
      await authRepo.saveData(
        userEntity: UserEntity(
          uid: uid,
          name: name,
          image: imageUrl,
          email: getUser().email,
          birthday: getUser().birthday,
        ),
      );

      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
