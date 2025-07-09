import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});

  @override
  String toString() => errorMessage;
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(errorMessage: message);

  static const String connectionTimeoutMsg =
      '⏳ Connection Timeout! Please try again later.';
  static const String sendTimeoutMsg =
      '🚀 Send Timeout! Unable to reach the server.';
  static const String receiveTimeoutMsg =
      '⏳ Receive Timeout! The server took too long to respond.';
  static const String badCertificateMsg =
      '🔒 Security Error! Invalid server certificate.';
  static const String requestCanceledMsg =
      '❌ Request Canceled! You canceled the request.';
  static const String connectionErrorMsg =
      '🌐 Connection Error! Please check your internet.';
  static const String noInternetMsg =
      '📶 No Internet Connection! Please check your network.';
  static const String unknownErrorMsg =
      '⚠️ Oops! Something went wrong, please try again.';
  static const String authErrorMsg =
      '🔑 Authentication Error! Please check your credentials.';
  static const String notFoundMsg =
      '🔍 Not Found! The requested resource was not found.';
  static const String serverErrorMsg =
      '🛠️ Server Error! Please try again later.';
  static const String unexpectedErrorMsg =
      '⚠️ Unexpected Error! Please try again.';

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: connectionTimeoutMsg);
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: sendTimeoutMsg);
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: receiveTimeoutMsg);
      case DioExceptionType.badCertificate:
        return ServerFailure(message: badCertificateMsg);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(message: requestCanceledMsg);
      case DioExceptionType.connectionError:
        return ServerFailure(message: connectionErrorMsg);
      case DioExceptionType.unknown:
        return ServerFailure(
          message: dioException.message?.contains('SocketException') ?? false
              ? noInternetMsg
              : unknownErrorMsg,
        );
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == null) {
      return ServerFailure(message: unknownErrorMsg);
    }

    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(
          message:
              response is Map &&
                  response.containsKey('error') &&
                  response['error'] is Map
              ? response['error']['message'] ?? authErrorMsg
              : authErrorMsg,
        );
      case 404:
        return ServerFailure(message: notFoundMsg);
      case 500:
        return ServerFailure(message: serverErrorMsg);
      default:
        return ServerFailure(message: unexpectedErrorMsg);
    }
  }
}
