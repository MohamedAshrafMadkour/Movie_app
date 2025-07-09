import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/data/Model/cast_model.dart';
import 'package:movie_app/features/main/data/Model/category_model.dart';
import 'package:movie_app/features/main/data/Model/channels_model/channels_model.dart';
import 'package:movie_app/features/main/data/Model/review_model/review_model.dart';
import 'package:movie_app/features/main/data/Model/trailer_model/trailer_model.dart';

abstract class MainRepo {
  Future<Either<Failure, List<AllFilmsModel>>> fetchPopularFilms();
  Future<Either<Failure, List<AllFilmsModel>>> fetchTopRelatedFilms();

  Future<Either<Failure, List<CastModel>>> fetchAllCast({required int id});

  Future<Either<Failure, List<ReviewModel>>> fetchAllReview({required int id});

  Future<Either<Failure, List<TrailerModel>>> fetchTrailer({required int id});

  Future<Either<Failure, ChannelsModel>> fetchAllChannel({required int id});

  Future<Either<Failure, List<CategoryModel>>> fetchSearchFilms({
    required int id,
  });
}
