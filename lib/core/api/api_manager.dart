import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_constant.dart';

@lazySingleton
class ApiManger {
  final Dio dio;
  ApiManger({required this.dio});
  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? qureyParmetes,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      ApiConstant.baseUrl + endPoint,
      queryParameters: qureyParmetes,
      options: Options(headers: headers),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? qureyParmetes,
    Object? body,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(
      ApiConstant.baseUrl + endPoint,
      queryParameters: qureyParmetes,
      data: body,
      options: Options(headers: headers),
    );
  }
}
