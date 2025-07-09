import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/error/failure.dart';
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
  Future<void> addData({required UserEntity userEntity});

  Future<UserEntity> fetchData({required String uid});
  Future deleteUser(User? user);
  Future<void> saveData({required UserEntity userEntity});
}
