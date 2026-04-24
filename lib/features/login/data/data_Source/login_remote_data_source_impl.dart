import 'package:dartz/dartz.dart';
import 'package:grocery1/core/api/api_endpoints.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:injectable/injectable.dart';

import '../model/login_model.dart';
import '../model/request_login_model.dart';
import 'login_remote_data_source.dart';

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  //  Login Model
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final request = RequestLoginModel(email: email, password: password);
      final response = await ApiManager().postData(
        endPoint: ApiEndpoints.loginEndpoint,
        body: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data as Map<String, dynamic>;
        final model = LoginModel.fromJson(responseData);
        return Right(model);
      } else {
        return Left(Failure("Error happened"));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
