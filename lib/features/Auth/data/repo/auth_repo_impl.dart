import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/constants/endpoints.dart';
import 'package:movie_app/core/constants/keys.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/services/auth_service.dart';
import 'package:movie_app/core/services/database.dart';
import 'package:movie_app/core/services/pref_storage.dart';
import 'package:movie_app/features/Auth/data/model/user_model.dart';
import 'package:movie_app/features/Auth/domain/entity/user_entity.dart';
import 'package:movie_app/features/Auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthService authService;
  final DatabaseService databaseService;

  AuthRepoImpl({required this.databaseService, required this.authService});
  @override
  Future<Either<Failure, UserEntity>> createEmailAndPassword({
    required String email,
    required String password,
    required String birthday,
  }) async {
    User? user;
    try {
      user = await authService.registerIn(
        email: email,
        password: password,
        birthday: birthday,
      );

      var userEntity = UserEntity(
        email: user.email ?? " ",
        uid: user.uid,
        birthday: birthday,
        name: user.displayName ?? " ",
        image: user.photoURL ?? " ",
      );
      addData(userEntity: userEntity);
      saveData(userEntity: userEntity);
      return Right(userEntity);
    } on AuthException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: 'opps something went wrong'));
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

  @override
  Future<void> addData({required UserEntity userEntity}) async {
    var user = UserModel.fromEntity(userEntity).toJson();
    await databaseService.addData(
      path: Endpoints.addUser,
      document: userEntity.uid,
      data: user,
    );
  }

  @override
  Future<UserEntity> fetchData({required String uid}) async {
    var data = await databaseService.fetchData(
      path: Endpoints.fetchUser,
      document: uid,
    );
    return UserModel.fromJson(data);
  }

  @override
  Future deleteUser(User? user) async {
    if (user != null) {
      await authService.deleteUser();
    }
  }

  @override
  Future<void> saveData({required UserEntity userEntity}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(userEntity).toJson());
    PrefStorage.setString(AllKeys.setDataUser, jsonData);
    log("userData: $jsonData");
  }
}
