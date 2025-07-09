import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/constants/endpoints.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/services/storage_service.dart';
import 'package:movie_app/features/profile/domain/repo/image_repo.dart';

class ImageRepoImpl extends ImageRepo {
  final StorageService storageService;

  ImageRepoImpl({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadImage(File file) async {
    try {
      var url = await storageService.uploadFile(file, Endpoints.imageStorage);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure(message: 'opps something went wrong'));
    }
  }
}
