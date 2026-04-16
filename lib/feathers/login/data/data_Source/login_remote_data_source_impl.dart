/*import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';

import 'package:grocery1/core/failure/failure.dart';

import 'package:grocery1/feathers/login/data/model/login_response_model.dart';

import '../model/request_login_model.dart';
import 'login_remote_data_source.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<Either<Failure, LoginResponseModel>> login({
    required String login,
    required String password,
  }) async {
    try {
      final request = RequestLoginModel(login: login, password: password);
      final response = await ApiManager().postData(
        endPoint: ApiEndpoints.loginEndpoint,
        body: request.toJson(),
      );

      if(response.statusCode==200||response.statusCode==201){
        final responseData=response.data;
      }
    } catch (e) {}

  }

}*/
