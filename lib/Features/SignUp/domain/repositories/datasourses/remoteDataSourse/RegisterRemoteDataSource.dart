import 'package:dartz/dartz.dart';
import 'package:grocery1/Features/SignUp/domain/entities/RegisterResponseEntity.dart';
import 'package:grocery1/core/failure/failure.dart';

abstract class Registerremotedatasource {
  Future <Either<Failure,RegisterResponseEntity>> register(String email, String name, String password, String rePassword,
      String phone);

}