import 'package:dartz/dartz.dart';

import 'package:grocery1/core/failure/failure.dart';

import '../../domain/forgot_password_repo.dart';

class ForgotPasswordRepoImpl implements ForgotPasswordRepo{

  @override
  Future<Either<Failure,void>> sendCode({String? email , String? phone })async{
    try{
      //call Api
      return Right(null);
    }catch(e){
      return Left(Failure(e.toString()));
    }

  }


  @override
  Future<Either<Failure,void>> verifyOtp( String otp)async{
    try{
      //call Api
      return Right(null);
    }catch(e){
      return Left(Failure(e.toString()));
    }

  }


  @override
  Future<Either<Failure,void>> resetPassword(String newPassword )async{
    try{
      //call Api
      return Right(null);
    }catch(e){
      return Left(Failure(e.toString()));
    }

  }
}