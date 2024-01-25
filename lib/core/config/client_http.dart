import 'package:dio/dio.dart';
import 'package:my_weather/core/config/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/either.dart';
import 'env.dart';

part 'client_http.g.dart';

@riverpod
ClientHttp clientHttp(ClientHttpRef ref) {
  return ClientHttp();
}

class ClientHttp {
  late final Dio _client;

  ClientHttp() {
    _client = Dio(BaseOptions(
      baseUrl: 'https://api.openweathermap.org',
      queryParameters: {
        'appid': Env.weatherApiKey,
      },
    ));

    _client.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        logger.d({
          'REQUEST[${options.method}]': options.uri,
          'REQUEST_HEADERS': options.headers,
          'REQUEST_DATA': options.data,
          'REQUEST_QUERY_PARAMETERS': options.queryParameters,
        });
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.d({
          'RESPONSE[${response.statusCode}]': response.realUri.path,
          'RESPONSE_HEADERS': response.headers.map,
          'RESPONSE_DATA': response.data,
          'REQUEST_QUERY_PARAMETERS': response.requestOptions.queryParameters,
        });
        return handler.next(response);
      },
      onError: (e, handler) {
        logger.d({
          'ERROR[${e.response?.statusCode}]': e.requestOptions.path,
          'ERROR_MESSAGE': e.message,
          'ERROR_DATA': e.response?.data,
        });

        return handler.next(e);
      },
    ));
  }

  Future<Either<ResponseError, dynamic>> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _client.get(
        url,
        queryParameters: queryParameters,
      );

      return Right(response.data);
    } catch (e) {
      final error = _handleError(e);
      return Left(error);
    }
  }

  ResponseError _handleError(Object e) {
    if (e is! DioException) {
      return ResponseError(
        message: 'Unknown error $e',
        statusCode: 500,
      );
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ResponseError(
          message: 'Connection timeout',
          statusCode: 408,
        );
      case DioExceptionType.sendTimeout:
        return ResponseError(
          message: 'Send timeout',
          statusCode: 408,
        );
      case DioExceptionType.receiveTimeout:
        return ResponseError(
          message: 'Receive timeout',
          statusCode: 408,
        );
      case DioExceptionType.badResponse:
        final data = e.response?.data;
        return ResponseError(
          message: data.toString(),
          statusCode: e.response?.statusCode ?? 500,
        );
      default:
        return ResponseError(
          message: 'Unknown error',
          statusCode: 500,
        );
    }
  }
}

class ResponseError {
  ResponseError({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;
}
