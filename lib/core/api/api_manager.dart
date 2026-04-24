import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:injectable/injectable.dart';

import 'api_constant.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        followRedirects: true,
        validateStatus: (status) => true, // عشان تمسك كل الـ responses
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  /// GET
  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) {
    return dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(headers: headers),
    );
  }

  /// POST
  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Map<String, dynamic>? headers,
    Options? options,
  }) {
    return dio.post(
      endPoint,
      queryParameters: queryParameters,
      data: body,
      options: (options ?? Options()).copyWith(headers: headers),
    );
  }
}