import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/server_failure.dart';
import 'package:movie_app/core/services/auth_service.dart';
import 'package:movie_app/features/Auth/data/model/user_model.dart';
import 'package:movie_app/features/Auth/domain/entity/user_entity.dart';
import 'package:movie_app/features/Auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthService authService;

  AuthRepoImpl({required this.authService});
  @override
  Future<Either<Failure, UserEntity>> createEmailAndPassword({
    required String email,
    required String password,
    required String birthday,
  }) async {
    try {
      var user = await authService.registerIn(
        email: email,
        password: password,
        birthday: birthday,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on AuthException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await authService.loginIn(email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on AuthException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await authService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await authService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }
}
