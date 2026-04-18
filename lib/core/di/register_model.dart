import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grocery1/core/api/api_constant.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {

  @singleton
  Dio dio() {
    return Dio(
      BaseOptions(
      //  baseUrl: ApiConstant.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveDataWhenStatusError: true,
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
  }

  @lazySingleton
  FlutterSecureStorage storage() {
    return const FlutterSecureStorage();
  }
}

