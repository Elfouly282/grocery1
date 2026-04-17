import 'package:dartz/dartz.dart';
import 'package:grocery1/domain/repositories/repositories/RegisterRepository.dart';
import 'package:injectable/injectable.dart';

import '../../core/failure/failure.dart';
import '../entities/RegisterResponseEntity.dart';
@injectable
class RegisterUseCase{
 RegisterRepository registerRepository;
  RegisterUseCase({required this.registerRepository});
 Future<Either <Failure,RegisterResponseEntity>> invoke(String name,String email,String password,
      String rePassword,String phone){
    return registerRepository.register(name, email, password, rePassword, phone);
  }
}