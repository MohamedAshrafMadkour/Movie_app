import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/server_failure.dart';
import 'package:movie_app/features/Auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createEmailAndPassword({
    required String email,
    required String password,
    required String birthday,
  });

  Future<Either<Failure, UserEntity>> loginEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, UserEntity>> signInWithFacebook();
}
