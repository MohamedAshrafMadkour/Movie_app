import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/keys.dart';

class ApiService {
  String basUrl = 'https://api.themoviedb.org/3/movie/';
  String basUrl2 = 'https://api.themoviedb.org/3/';
  String apiKey = AllKeys.apiKey;
  String apiAuth = AllKeys.apiAuth;
  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.get(
      basUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(headers: {'Authorization': 'Bearer $apiAuth'}),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getAndSearch({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.get(
      basUrl2 + endPoint,
      queryParameters: queryParameters,
      options: Options(headers: {'Authorization': 'Bearer $apiAuth'}),
    );
    return response.data;
  }
}

//search
//https://api.themoviedb.org/3/discover/movie?api_key=YOUR_API_KEY&language=ar-EG&with_genres=12
//reviews
//https://api.themoviedb.org/3/movie/500/reviews?api_key=638cd2a08d9cca6ac125679db7d7adf3&page=1
//cast
//https://api.themoviedb.org/3/movie/500/credits?api_key=638cd2a08d9cca6ac125679db7d7adf3&language=ar-EG
//list
//https://api.themoviedb.org/3/movie/popular?api_key=638cd2a08d9cca6ac125679db7d7adf3&language=ar-EG&page=1
//channels
//https://api.themoviedb.org/3/movie/500/watch/providers?api_key=638cd2a08d9cca6ac125679db7d7adf3
//details
//https://api.themoviedb.org/3/movie/500?api_key=638cd2a08d9cca6ac125679db7d7adf3
//trailer
//https://api.themoviedb.org/3/movie/500/videos?api_key=638cd2a08d9cca6ac125679db7d7adf3
