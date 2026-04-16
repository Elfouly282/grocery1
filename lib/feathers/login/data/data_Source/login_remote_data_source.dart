import 'package:dartz/dartz.dart';
import 'package:grocery1/core/failure/failure.dart';
import 'package:grocery1/feathers/login/data/model/login_response_model.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure, LoginResponseModel>> login({
    required String login,
    required String password,
  });
}
