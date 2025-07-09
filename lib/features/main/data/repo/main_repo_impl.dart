import 'package:dartz/dartz.dart';
import 'package:movie_app/core/constants/keys.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/services/api_service.dart';
import 'package:movie_app/features/main/data/Model/all_films_model.dart';
import 'package:movie_app/features/main/data/Model/cast_model.dart';
import 'package:movie_app/features/main/data/Model/category_model.dart';
import 'package:movie_app/features/main/data/Model/channels_model/channels_model.dart';
import 'package:movie_app/features/main/data/Model/review_model/review_model.dart';
import 'package:movie_app/features/main/data/Model/trailer_model/trailer_model.dart';
import 'package:movie_app/features/main/domain/repo/main_repo.dart';

class MainRepoImpl extends MainRepo {
  final ApiService apiService;
  String apiKey = AllKeys.apiKey;
  MainRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<AllFilmsModel>>> fetchPopularFilms() async {
    try {
      //https://api.themoviedb.org/3/movie/popular?api_key=638cd2a08d9cca6ac125679db7d7adf3&language=ar-EG&page=1
      var response = await apiService.get(
        endPoint: 'popular?',
        queryParameters: {'api_key': apiKey, 'language': 'ar-EG'},
      );
      List<AllFilmsModel> popularMovie = [];
      for (var item in response['results']) {
        popularMovie.add(AllFilmsModel.fromJson(item));
      }
      return Right(popularMovie);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AllFilmsModel>>> fetchTopRelatedFilms() async {
    //https://api.themoviedb.org/3/movie/top_rated?api_key=638cd2a08d9cca6ac125679db7d7adf3&language=ar-EG&page=1

    try {
      var response = await apiService.get(
        endPoint: 'top_rated?',
        queryParameters: {'api_key': apiKey, 'language': 'ar-EG'},
      );
      List<AllFilmsModel> topRelatedMovies = [];
      for (var item in response['results']) {
        topRelatedMovies.add(AllFilmsModel.fromJson(item));
      }
      return Right(topRelatedMovies);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CastModel>>> fetchAllCast({
    required int id,
  }) async {
    try {
      //https://api.themoviedb.org/3/movie/500/credits?api_key=638cd2a08d9cca6ac125679db7d7adf3&language=ar-EG

      var response = await apiService.get(
        endPoint: '$id/credits?',
        queryParameters: {'api_key': apiKey, 'language': 'ar-EG'},
      );
      List<CastModel> movieCast = [];
      for (var item in response['cast']) {
        movieCast.add(CastModel.fromJson(item));
      }
      return Right(movieCast);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChannelsModel>> fetchAllChannel({
    required int id,
  }) async {
    try {
      var response = await apiService.get(
        endPoint: '$id/watch/providers',
        queryParameters: {'api_key': apiKey},
      );

      final model = ChannelsModel.fromJson(response);
      return Right(model);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ReviewModel>>> fetchAllReview({
    required int id,
  }) async {
    try {
      //https://api.themoviedb.org/3/movie/500/reviews?api_key=638cd2a08d9cca6ac125679db7d7adf3&page=1
      var response = await apiService.get(
        endPoint: '$id/reviews?',
        queryParameters: {'api_key': apiKey, 'page': '1'},
      );
      List<ReviewModel> reviews = [];
      for (var item in response['results']) {
        reviews.add(ReviewModel.fromJson(item));
      }
      return Right(reviews);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TrailerModel>>> fetchTrailer({
    required int id,
  }) async {
    try {
      //'https://api.themoviedb.org/3/movie/'
      //https://api.themoviedb.org/3/movie/500/videos?api_key=638cd2a08d9cca6ac125679db7d7adf3
      var response = await apiService.get(
        endPoint: '$id/videos?',
        queryParameters: {'api_key': apiKey},
      );
      List<TrailerModel> trailers = [];
      for (var item in response['results']) {
        trailers.add(TrailerModel.fromJson(item));
      }
      return Right(trailers);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> fetchSearchFilms({
    required int id,
  }) async {
    try {
      //https://api.themoviedb.org/3/discover/movie?api_key=YOUR_API_KEY&language=ar-EG&with_genres=12
      var response = await apiService.getAndSearch(
        endPoint: 'discover/movie?',
        queryParameters: {
          'api_key': apiKey,
          'language': 'ar-EG',
          'with_genres': '$id',
        },
      );
      List<CategoryModel> searchFilms = [];
      for (var item in response['results']) {
        searchFilms.add(CategoryModel.fromJson(item));
      }
      return Right(searchFilms);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

//search
//https://api.themoviedb.org/3/discover/movie?api_key=YOUR_API_KEY&language=ar-EG&with_genres=12
//reviews
//https://api.themoviedb.org/3/movie/500/reviews?api_key=638cd2a08d9cca6ac125679db7d7adf3&page=1
//cast
//https://api.themoviedb.org/3/movie/500/credits?api_key=638cd2a08d9cca6ac125679db7d7adf3&language=ar-EG
//popular
//https://api.themoviedb.org/3/movie/popular?api_key=638cd2a08d9cca6ac125679db7d7adf3&language=ar-EG&page=1
//top related
//https://api.themoviedb.org/3/movie/top_rated?api_key=638cd2a08d9cca6ac125679db7d7adf3&language=ar-EG&page=1
//channels
//https://api.themoviedb.org/3/movie/500/watch/providers?api_key=638cd2a08d9cca6ac125679db7d7adf3
//details
//https://api.themoviedb.org/3/movie/500?api_key=638cd2a08d9cca6ac125679db7d7adf3
//trailer
//https://api.themoviedb.org/3/movie/500/videos?api_key=638cd2a08d9cca6ac125679db7d7adf3
