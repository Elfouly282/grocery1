import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constant.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();
  factory ApiManager() => _instance;

  late final Dio _dio;

  ApiManager._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
        followRedirects: true,
        validateStatus: (status) => status! < 400,
      ),
    );

    _dio.interceptors.add(
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

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    return _dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(headers: headers),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Map<String, dynamic>? headers,
    Options? options,
  }) async {
    return _dio.post(
      endPoint,
      queryParameters: queryParameters,
      data: body,
      options: (options ?? Options()).copyWith(headers: headers),
    );
  }
}