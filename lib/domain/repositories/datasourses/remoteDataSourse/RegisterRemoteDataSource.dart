import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../entities/RegisterResponseEntity.dart';

abstract class Registerremotedatasource {
  Future <Either<Failure,RegisterResponseEntity>> register(String email, String name, String password, String rePassword,
      String phone);
}