import 'package:dartz/dartz.dart';
import 'package:movie_app/core/constants/endpoints.dart';
import 'package:movie_app/core/error/server_failure.dart';
import 'package:movie_app/core/services/database.dart';
import 'package:movie_app/features/profile/domain/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final DatabaseService databaseService;

  ProfileRepoImpl({required this.databaseService});

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
      return Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
