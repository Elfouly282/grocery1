
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_constant.dart';
@singleton
class ApiManger {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      validateStatus: (status) => true,
    ),
  );


  Future<Response>getData({required String endPoint,
    Map<String,dynamic>?qureyParmetes,
    Options?options,
    Map<String,dynamic>?headers,})

  {
    return dio.get(ApiConstant.baseUrl+endPoint,
        queryParameters:qureyParmetes,
        options:Options(headers:headers) );
  }
  Future <Response>postData(
      {required String endPoint,
        Map<String, dynamic>? queryParameters,
        Options? options,
        Object? body,
        Map<String, dynamic>? headers}) {
    return dio.post(ApiConstant.baseUrl + endPoint,
      queryParameters: queryParameters,
      options: Options(headers: headers,validateStatus: (status)=>true),
      data: body,

    );
  }
}
@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl, // 🔥 مهم
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        validateStatus: (status) => true, // 🔥 عشان تتعامل مع 422 وغيره
      ),
    );
  }

  /// GET
  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  /// POST
  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(
      endPoint,
      queryParameters: queryParameters,
      data: body,
      options: Options(headers: headers),
    );
  }
}