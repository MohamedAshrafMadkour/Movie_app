import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';

abstract class ImageRepo {
  Future<Either<Failure, String>> uploadImage(File file);
}
