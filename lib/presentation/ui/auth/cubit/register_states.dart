

import 'dart:isolate';

import 'package:grocery1/core/failure/failure.dart';

import '../../../../domain/entities/RegisterResponseEntity.dart';

abstract class RegisterStates{}
class RegisterInitState extends RegisterStates
{}
class  RegisterLoadingState extends RegisterStates
{

}
class RegisterErrorState extends RegisterStates{
Failure errorMessage;
 RegisterErrorState({required this.errorMessage});
}
class RegisterSuccessState extends RegisterStates{
RegisterResponseEntity responseEntity;
RegisterSuccessState({required this.responseEntity});
}
