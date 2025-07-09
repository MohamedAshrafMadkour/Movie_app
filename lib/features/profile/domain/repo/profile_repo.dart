import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> updateUserdata({
    required String uid,
    required String name,
    required String imageUrl,
  });
}
